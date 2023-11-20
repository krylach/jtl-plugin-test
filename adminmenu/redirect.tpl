<div class="form-group form-row align-items-center col-xs-12 col-md-12">
    <div class="col col-sm-5 input-group">
        <div class="input-group-prepend">
            <label class="input-group-text">{__('From land')}</label>
        </div>
        {* <input type="text" name="preload-url[]" class="form-control" placeholder="{__('URL')}" value="{if $c !== null}{$c->src}{/if}" aria-label="{__('URL')}"> *}
    </div>
    {dd($lands)}
    <div class="input-group col col-sm-3">
        <div class="input-group-prepend">
            <label class="input-group-text">{__('Type')}</label>
        </div>
        <select class="custom-select form-control" name="land">
            {* {foreach $lands as $land}
                <option value="{$land->cDeutsch}">{$land->cDeutsch}</option>
            {/foreach} *}
        </select>
        <div class="input-group-append">
            <button type="button" class="btn btn-danger delete-row" aria-label="{__('delete')}"><i class="fa fa-trash"></i></button>
        </div>
    </div>
</div>
