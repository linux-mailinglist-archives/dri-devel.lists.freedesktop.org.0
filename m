Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E529DC1B0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365056EB06;
	Fri, 18 Oct 2019 09:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (unknown [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 830746EB06
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:49:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1790492;
 Fri, 18 Oct 2019 02:49:08 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26FD3F6C4;
 Fri, 18 Oct 2019 02:49:08 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 81002682189; Fri, 18 Oct 2019 10:49:07 +0100 (BST)
Date: Fri, 18 Oct 2019 10:49:07 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/arm: make undeclared items static
Message-ID: <20191018094907.66ghzs3qiyelibzh@e110455-lin.cambridge.arm.com>
References: <20191017111756.12861-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017111756.12861-1-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@lists.codethink.co.uk, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 malidp@foss.arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MTc6NTVQTSArMDEwMCwgQmVuIERvb2tzIChDb2Rl
dGhpbmspIHdyb3RlOgo+IE1ha2UgdGhlIGZvbGxvd2luZyBpdGVtcyBzdGF0aWMgdG8gYXZvaWQg
Y2xhc2hlcyB3aXRoCj4gb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbCAoZGV2X2F0dHJfY29yZV9p
ZCkgb3IganVzdAo+IHNpbGVuY2UgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZzoKPiAKPiBk
cml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYzozNzE6MjQ6IHdhcm5pbmc6IHN5bWJvbCAn
bWFsaWRwX2ZiX2NyZWF0ZScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8K
PiBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYzo0OTQ6Njogd2FybmluZzogc3ltYm9s
ICdtYWxpZHBfZXJyb3Jfc3RhdHNfZHVtcCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KPiBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYzo2Njg6MTogd2Fybmlu
Zzogc3ltYm9sICdkZXZfYXR0cl9jb3JlX2lkJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQg
YmUgc3RhdGljPwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0
aGluay5jby51az4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4K
ClRoYW5rcyBmb3IgdGhlIHBhdGNoISBBcyBhIHNpZGUgbm90ZTogdGhlIGRpbSB0b29sIHRoYXQg
d2UgdXNlIGluIHRoZSBEUk0gc3Vic3lzdGVtCmZsYWdzIHlvdXIgUy1vLWIgYXMgYmVpbmcgZGlm
ZmVyZW50IGZyb20gYXV0aG9yLCBkdWUgdG8gIihDb2RldGhpbmspIiBhZGRpdGlvbiBpbiB0aGUK
ZW1haWwgbmFtZS4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gQ2M6IExpdml1IER1ZGF1
IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IENjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5
QGFybS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBtYWxpZHBAZm9zcy5hcm0uY29tCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZwo+IC4uIChvcGVuIGxpc3QpCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jIHwgMTAgKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
aW5kZXggMzMzYjg4YTVlZmIwLi4xOGNhNDNjOWNlZjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9kcnYuYwo+IEBAIC0zNjgsNyArMzY4LDcgQEAgbWFsaWRwX3ZlcmlmeV9hZmJjX2ZyYW1lYnVm
ZmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCXJl
dHVybiBmYWxzZTsKPiAgfQo+ICAKPiAtc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqCj4gK3N0YXRp
YyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoKPiAgbWFsaWRwX2ZiX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gIAkJIGNvbnN0IHN0cnVjdCBk
cm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkKPiAgewo+IEBAIC00OTEsOSArNDkxLDkgQEAgdm9p
ZCBtYWxpZHBfZXJyb3Ioc3RydWN0IG1hbGlkcF9kcm0gKm1hbGlkcCwKPiAgCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJm1hbGlkcC0+ZXJyb3JzX2xvY2ssIGlycWZsYWdzKTsKPiAgfQo+ICAKPiAt
dm9pZCBtYWxpZHBfZXJyb3Jfc3RhdHNfZHVtcChjb25zdCBjaGFyICpwcmVmaXgsCj4gLQkJCSAg
ICAgc3RydWN0IG1hbGlkcF9lcnJvcl9zdGF0cyBlcnJvcl9zdGF0cywKPiAtCQkJICAgICBzdHJ1
Y3Qgc2VxX2ZpbGUgKm0pCj4gK3N0YXRpYyB2b2lkIG1hbGlkcF9lcnJvcl9zdGF0c19kdW1wKGNv
bnN0IGNoYXIgKnByZWZpeCwKPiArCQkJCSAgICBzdHJ1Y3QgbWFsaWRwX2Vycm9yX3N0YXRzIGVy
cm9yX3N0YXRzLAo+ICsJCQkJICAgIHN0cnVjdCBzZXFfZmlsZSAqbSkKPiAgewo+ICAJc2VxX3By
aW50ZihtLCAiWyVzXSBudW1fZXJyb3JzIDogJWRcbiIsIHByZWZpeCwKPiAgCQkgICBlcnJvcl9z
dGF0cy5udW1fZXJyb3JzKTsKPiBAQCAtNjY1LDcgKzY2NSw3IEBAIHN0YXRpYyBzc2l6ZV90IGNv
cmVfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLAo+ICAJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJTA4eFxuIiwgbWFsaWRw
LT5jb3JlX2lkKTsKPiAgfQo+ICAKPiAtREVWSUNFX0FUVFJfUk8oY29yZV9pZCk7Cj4gK3N0YXRp
YyBERVZJQ0VfQVRUUl9STyhjb3JlX2lkKTsKPiAgCj4gIHN0YXRpYyBpbnQgbWFsaWRwX2luaXRf
c3lzZnMoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKPT09
PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8
CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEg
IC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
