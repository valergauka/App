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
        Schema::create('approves', function (Blueprint $table) {
            $table->id();
            $table->date('committeMNDate');
            $table->integer('committeMNNumber')->nullable();
            $table->date('committeSCDate');
            $table->integer('committeSCNumber')->nullable();
            $table->integer('orderNumber')->nullable();
            $table->date('orderDate');
            $table->string('resolution');

            $table->softDeletes();
            $table->timestamps();

            $table->unsignedBigInteger('review_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('approves');
    }
};
