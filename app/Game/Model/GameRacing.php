<?php

declare(strict_types=1);
/**
 * This file is part of MineAdmin.
 *
 * @link     https://www.mineadmin.com
 * @document https://doc.mineadmin.com
 * @contact  root@imoi.cn
 * @license  https://github.com/mineadmin/MineAdmin/blob/master/LICENSE
 */

namespace App\Game\Model;

use Carbon\Carbon;
use Hyperf\Database\Model\SoftDeletes;
use Mine\MineModel;

/**
 * @property int $id 主键id
 * @property string $dark_tax_scale 暗税
 * @property string $anchor_scale 主播抽成
 * @property int $pool 1 默认水库
 * @property int $periodic_pattern 1每小时 2,整点 3,每周 4,长期
 * @property int $created_by 创建者
 * @property int $updated_by 更新者
 * @property Carbon $created_at 创建时间
 * @property Carbon $updated_at 更新时间
 * @property string $deleted_at 删除时间
 * @property string $remark 备注
 */
class GameRacing extends MineModel
{
    use SoftDeletes;

    /**
     * The table associated with the model.
     */
    protected ?string $table = 'game_racing';

    /**
     * The attributes that are mass assignable.
     */
    protected array $fillable = [
        'id',
        'dark_tax_scale',
        'anchor_scale',
        'pool',
        'periodic_pattern',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
        'remark',
    ];

    /**
     * The attributes that should be cast to native types.
     */
    protected array $casts = [
        'id' => 'integer',
        'dark_tax_scale' => 'decimal:2',
        'anchor_scale' => 'decimal:2',
        'pool' => 'integer',
        'periodic_pattern' => 'integer',
        'created_by' => 'integer',
        'updated_by' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}
