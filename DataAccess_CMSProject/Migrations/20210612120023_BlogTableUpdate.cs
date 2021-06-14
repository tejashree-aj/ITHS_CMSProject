using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess_CMSProject.Migrations
{
    public partial class BlogTableUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Blogs_Pages_PageId",
                table: "Blogs");

            migrationBuilder.DropIndex(
                name: "IX_Blogs_PageId",
                table: "Blogs");

            migrationBuilder.DropColumn(
                name: "PageId",
                table: "Blogs");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PageId",
                table: "Blogs",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Blogs_PageId",
                table: "Blogs",
                column: "PageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Blogs_Pages_PageId",
                table: "Blogs",
                column: "PageId",
                principalTable: "Pages",
                principalColumn: "PageId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
