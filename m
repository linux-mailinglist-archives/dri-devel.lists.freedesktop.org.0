Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6039F59
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 13:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DBB891D5;
	Sat,  8 Jun 2019 11:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47CC891D5
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 11:56:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C25AF80500;
 Sat,  8 Jun 2019 13:56:09 +0200 (CEST)
Date: Sat, 8 Jun 2019 13:56:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dingchen Zhang <dingchen.zhang@amd.com>
Subject: Re: [PATCH] drm: remove the newline for CRC source name.
Message-ID: <20190608115608.GA15120@ravnborg.org>
References: <20190607213817.11767-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607213817.11767-1-dingchen.zhang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=zd2uoN0lAAAA:8 a=OkEZnbcGD1GArhnsZsIA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGluZ2NoZW4uCgpQYXRjaCBpcyBtdWNoIGJldHRlciBub3cuCgpPbiBGcmksIEp1biAwNywg
MjAxOSBhdCAwNTozODoxN1BNIC0wNDAwLCBEaW5nY2hlbiBaaGFuZyB3cm90ZToKPiB1c2Vyc3Bh
Y2UgbWF5IHRyYW5zZmVyIGEgbmV3bGluZSwgYW5kIHRoaXMgdGVybWluYXRpbmcgbmV3bGluZQo+
IGlzIHJlcGxhY2VkIGJ5IGEgJ1wwJyB0byBhdm9pZCBmb2xsb3d1cCBpc3N1ZXMuCj4gCj4gJ24t
MScgaXMgdGhlIGluZGV4IHRvIHJlcGxhY2UgdGhlIG5ld2xpbmUgb2YgQ1JDIHNvdXJjZSBuYW1l
LgpJIGFtIGEgbGl0dGxlIGNvbmZ1c2VkIHdoZXJlICduJyBjb21lcyBmcm9tIGhlcmU/CkkgeW91
IGhhZCB3cml0dGVuICcgbGVuIC0gMScgdGhlbiB0aGVyZSB3YXMgYSBjbGVhciBjb25uZWN0aW9u
IHRvIHRoZQpwYXRjaC4KCldpdGggdGhpcyBmaXhlZDoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAKPiB2MjogdXBkYXRlIHBhdGNoIHN1YmplY3QsIGJvZHkg
YW5kIGZvcm1hdC4gKFNhbSkKPiAKPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4g
Q2M6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgo+IENjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcg
PGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmc19jcmMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBpbmRleCA1ODUx
NjlmMGRjYzUuLmRhYzI2N2U4NDBhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RlYnVnZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMK
PiBAQCAtMTMxLDggKzEzMSw4IEBAIHN0YXRpYyBzc2l6ZV90IGNyY19jb250cm9sX3dyaXRlKHN0
cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqdWJ1ZiwKPiAgCWlmIChJU19FUlIo
c291cmNlKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihzb3VyY2UpOwo+ICAKPiAtCWlmIChzb3VyY2Vb
bGVuXSA9PSAnXG4nKQo+IC0JCXNvdXJjZVtsZW5dID0gJ1wwJzsKPiArCWlmIChzb3VyY2VbbGVu
IC0gMV0gPT0gJ1xuJykKPiArCQlzb3VyY2VbbGVuIC0gMV0gPSAnXDAnOwo+ICAKPiAgCXJldCA9
IGNydGMtPmZ1bmNzLT52ZXJpZnlfY3JjX3NvdXJjZShjcnRjLCBzb3VyY2UsICZ2YWx1ZXNfY250
KTsKPiAgCWlmIChyZXQpCj4gLS0gCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
