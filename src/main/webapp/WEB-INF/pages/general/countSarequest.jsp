<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2/5/2021
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="row">
    <!-- /.col -->
    <div class="col-xl-3 col-md-6 col-12">
        <div class="box box-inverse box-warning">
            <div class="box-body">
                <div class="flexbox">
                    <h5>Chờ giải quyết</h5>
                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                Details</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                new</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                Refresh</a>
                        </div>
                    </div>
                </div>
                <div class="text-center my-2">
                    <div class="font-size-60">${countWait}</div>
                    <span>Yêu cầu chờ thẩm định</span>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col -->
    <div class="col-xl-3 col-md-6 col-12 ">
        <div class="box box-inverse box-primary">
            <div class="box-body">
                <div class="flexbox">
                    <h5>Chờ ký duyệt</h5>
                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                Details</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                new</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                Refresh</a>
                        </div>
                    </div>
                </div>

                <div class="text-center my-2">
                    <div class="font-size-60">${countWFS}</div>
                    <span>Yêu cầu chờ ký duyệt</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 col-12 ">
        <div class="box box-inverse box-success">
            <div class="box-body">
                <div class="flexbox">
                    <h5>Đã ký duyệt</h5>
                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                Details</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                new</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                Refresh</a>
                        </div>
                    </div>
                </div>
                <div class="text-center my-2">
                    <div class="font-size-60">${countAct}</div>
                    <span>Yêu cầu đã được giải ngân</span>
                </div>

            </div>
        </div>
    </div>
    <!-- /.col -->
    <div class="col-xl-3 col-md-6 col-12 ">
        <div class="box box-inverse " style="background-color: hotpink">
            <div class="box-body">
                <div class="flexbox">
                    <h5> Đã giải ngân</h5>
                    <div class="dropdown">
											<span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                                    class="ion-android-more-vertical rotate-90"></i></span>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="ion-android-list"></i>
                                Details</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add
                                new</a>
                            <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                Refresh</a>
                        </div>
                    </div>
                </div>

                <div class="text-center my-2">
                    <div class="font-size-60">${countDone}</div>
                    <span>Yêu cầu tất toán thành công</span>
                </div>
            </div>

        </div>
    </div>
</div>
