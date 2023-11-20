<?php declare(strict_types=1);

namespace Plugin\jtl_landswitcher\Models;

use Exception;
use Illuminate\Support\Collection;
use JTL\Model\DataAttribute;
use JTL\Model\DataModel;
use JTL\Plugin\Admin\InputType;
use JTL\Shop;

class RedirectModel extends DataModel
{
    /**
     * @inheritdoc
     */
    public function getTableName(): string
    {
        return 'jtl_landswitcher_redirects';
    }

    public function setKeyName($keyName): void
    {
        throw new Exception(__METHOD__ . ': setting of keyname is not supported', self::ERR_DATABASE);
    }

    public function getAttributes(): array
    {
        return [
            'id' => DataAttribute::create('id', 'int', null, false, true),
            'tland' => DataAttribute::create('tland', 'varchar', null, false, true),
            'url' => DataAttribute::create('url', 'varchar', null, false, true),
        ];
    }
}

