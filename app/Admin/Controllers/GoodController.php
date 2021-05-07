<?php

namespace App\Admin\Controllers;

use App\Models\Good;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GoodController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Good';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Good());

        $grid->column('id', __('商品id'));
        $grid->column('name', __('商品名称'));
        $grid->column('owner', __('商品所有者'));
        $grid->column('description', __('商品描述'));
        $grid->column('deadline', __('商品上架截止日期'));
        $grid->column('cover_image', __('商品封面图片'));
        $grid->column('publicity_video', __('商品宣传视频'));
        $grid->column('issuer', __('商品发布方'));
        $grid->column('sale_quantity', __('商品销量'));
        $grid->column('created_at', __('商品创建时间'));
        $grid->column('updated_at', __('商品更新时间'));


        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Good::findOrFail($id));

        $show->field('id', __('商品id'));
        $show->field('name', __('商品名称'));
        $show->field('owner', __('商品所有者'));
        $show->field('description', __('商品描述'));
        $show->field('deadline', __('商品上架截止日期'));
        $show->field('cover_image', __('商品封面图片'));
        $show->field('publicity_video', __('商品宣传视频'));
        $show->field('issuer', __('商品发布方'));
        $show->field('sale_quantity', __('商品销量'));
        $show->field('created_at', __('商品创建时间'));
        $show->field('updated_at', __('商品更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Good());

        $form->text('name', __('商品名称'));
        $form->text('owner', __('商品所有者'));
        $form->textarea('description', __('商品描述'));
        $form->datetime('deadline', __('商品上架截止日期'))->default(date('Y-m-d H:i:s'));
        $form->text('cover_image', __('商品封面图片'));
        $form->text('publicity_video', __('商品宣传视频'));
        $form->text('issuer', __('商品发布方'));
        $form->number('sale_quantity', __('商品销量'));

        return $form;
    }
}
