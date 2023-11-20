<?php declare(strict_types=1);

namespace Plugin\jtl_landswitcher\Migrations;

use JTL\Plugin\Migration;
use JTL\Update\IMigration;

class Migration20231120003120 extends Migration implements IMigration
{
    public function up()
    {
        $this->execute(
            "CREATE TABLE IF NOT EXISTS `jtl_landswitcher_redirects` (
                `id` int(10) NOT NULL AUTO_INCREMENT,
                `url` varchar(255) NOT NULL,
                `land` varchar(255) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX jtl_landswitcher_url_index (url),
                INDEX jtl_landswitcher_land (land)
            ) ENGINE=InnoDB COLLATE utf8_unicode_ci"
        );
    }

    public function down()
    {
        $this->execute("DROP TABLE IF EXISTS `jtl_landswitcher_redirects`");
    }
}