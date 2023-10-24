

import '../model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel= CategoryModel();

  categoryModel.categoryName="Business";
  categoryModel.image="images/bussines.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName="Entertainment";
  categoryModel.image="images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName="Genreal";
  categoryModel.image="images/genreal.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName="Health";
  categoryModel.image="images/health.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName="Science";
  categoryModel.image="images/scince.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName="Sports";
  categoryModel.image="images/sport.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}