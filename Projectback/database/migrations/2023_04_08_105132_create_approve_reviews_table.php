<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('approve_reviews', function (Blueprint $table) {
            $table->id();
            $table->integer('idReview');
            $table->date('committeMNDate');
            $table->integer('committeMNNumber');
            $table->date('committeSCDate');
            $table->integer('committeSCNumber');
            $table->date('orderDate');
            $table->integer('orderNumber');
            $table->string('resolution');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('approve_reviews');
    }
};
