<?php declare(strict_types=1);

namespace Plugin\jtl_landswitcher;

use JTL\Events\Dispatcher;
use JTL\Helpers\Form;
use JTL\Plugin\Bootstrapper;
use JTL\Plugin\Data\Config;
use JTL\Shop;
use JTL\Smarty\JTLSmarty;
use Plugin\jtl_landswitcher\Models\RedirectModel;
use Plugin\jtl_landswitcher\Models\TLandModel;

class Bootstrap extends Bootstrapper
{
    public function boot(Dispatcher $dispatcher): void
    {
        parent::boot($dispatcher);
    }

    public function renderAdminMenuTab(string $tabName, int $menuID, JTLSmarty $smarty): string
    {
        $this->process();

        $lands = $this->getDb()
            ->selectArray("tland", [], []);

        $redirects = $this->getDB()
            ->selectArray('jtl_landswitcher_redirects', [], []);

        return $smarty->assign('redirects', $redirects)
            ->assign('lands', $lands)
            ->fetch(
                $this->getPlugin()
                    ->getPaths()
                    ->getAdminPath()
                    . 'list.tpl'
            );
    }

    private function process(): void
    {
        if (isset($_POST['create']) && Form::validateToken()) {
            $data = (object)$_POST['create'];

            $this->creating($data);
        } elseif (isset($_POST['update']) && Form::validateToken()) {
            $data = (object)$_POST['update'];

            $this->updating($data, $data->id);
        } elseif (isset($_POST['delete']) && Form::validateToken()) {
            $data = (object)$_POST['delete'];

            $this->delete($data->id);
        }
    }

    private function delete($id)
    {
        return $this->getDB()->delete('jtl_landswitcher_redirects', 'id', $id);
    }

    private function updating($data, $id)
    {
        unset($data->id);

        return $this->getDB()->update(
            'jtl_landswitcher_redirects',
            'id',
            $id,
            $data
        );
    }

    private function creating(object $data)
    {
        return $this->getDB()->insert('jtl_landswitcher_redirects', $data);
    }
}
