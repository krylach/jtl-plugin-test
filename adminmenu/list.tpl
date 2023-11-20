


<div class="card">
    <div class="card-header">
        <div class="subheading1">{__('Create redirect')}</div>
        <hr class="mb-n3">
    </div>
    <div class="card-body">
        <form method="post" class="form">
            <div class="form-group form-row align-items-center col-xs-12 col-md-12">
                {$jtl_token}
                <div class="col col-sm-5 input-group">
                    <div class="input-group-prepend">
                        <label class="input-group-text">{__('From land')}</label>
                    </div>
                    <select class="custom-select form-control" name="create[land]">
                        {foreach $lands as $land}
                            <option value="{$land->cDeutsch}">{$land->cDeutsch}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="input-group col col-sm-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text">{__('URL')}</label>
                    </div>
                    <input type="text" name="create[url]" class="form-control" placeholder="{__('URL')}" aria-label="{__('URL')}">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-success" aria-label="{__('save')}"><i class="fa fa-save"></i></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="card-footer">
    </div>
</div>

<div class="card">
    <div class="card-header">
        <div class="subheading1">{__('Redirects list')}</div>
        <hr class="mb-n3">
    </div>
    <div class="card-body">
        {if $redirects}
            {foreach $redirects as $redirect}
                <form method="post" class="form">
                    <input type="hidden" name="update[id]" value="{$redirect->id}">
                    <div class="form-group form-row align-items-center col-xs-12 col-md-12">
                        {$jtl_token}
                        <div class="col col-sm-5 input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text">{__('From land')}</label>
                            </div>
                            <select class="custom-select form-control" name="update[land]">
                                {foreach $lands as $land}
                                    <option value="{$land->cDeutsch}" {if $land->cDeutsch == $redirect->land}selected{/if}>{$land->cDeutsch}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="input-group col col-sm-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text">{__('URL')}</label>
                            </div>
                            <input type="text" name="update[url]" value="{$redirect->url}" class="form-control" placeholder="{__('URL')}" aria-label="{__('URL')}">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary" aria-label="{__('update')}"><i class="fa fa-save"></i></button>
                            </div>
                            <div class="input-group-append">
                                {* <form method="post" class="form">
                                    {$jtl_token}
                                    <input type="hidden" name="delete[id]" value="{$redirect->id}">
                                    <button type="submit" class="btn btn-danger" aria-label="{__('delete')}"><i class="fa fa-trash"></i></button>
                                </form> *}
                            </div>
                        </div>
                    </div>
                </form>
            {/foreach}
        {/if}                
    </div>
    <div class="card-footer">
    </div>
</div>