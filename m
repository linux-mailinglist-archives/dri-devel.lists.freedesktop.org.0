Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0E85237
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 19:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DB66E748;
	Wed,  7 Aug 2019 17:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56276E742;
 Wed,  7 Aug 2019 17:38:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F095020187;
 Wed,  7 Aug 2019 19:38:39 +0200 (CEST)
Date: Wed, 7 Aug 2019 19:38:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807173838.GB30025@ravnborg.org>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
 a=AFl41HnQPOZoGf6WJ1QA:9 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9yZGFuLgpPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMToyNDoyN0FNIC0wNjAwLCBKb3Jk
YW4gQ3JvdXNlIHdyb3RlOgo+IE1vc3QgdXNlIGNhc2VzIGZvciBEUk1fTVNNIHdpbGwgcHJlZmVy
IHRvIGJ1aWxkIGJvdGggRFJNIGFuZCBNU01fRFJNIGFzCj4gbW9kdWxlcyBidXQgdGhlcmUgYXJl
IHNvbWUgY2FzZXMgd2hlcmUgRFJNIG1pZ2h0IGJlIGJ1aWx0IGluIGZvciB3aGF0ZXZlcgo+IHJl
YXNvbiBhbmQgaW4gdGhvc2Ugc2l0dWF0aW9ucyBpdCBpcyBwcmVmZXJhYmxlIHRvIHN0aWxsIGtl
ZXAgTVNNIGFzIGEKPiBtb2R1bGUgYnkgZGVmYXVsdCBhbmQgbGV0IHRoZSB1c2VyIGRlY2lkZSBp
ZiB0aGV5IF9yZWFsbHlfIHdhbnQgdG8gYnVpbGQKPiBpdCBpbi4KPiAKPiBBZGRpdGlvbmFsbHkg
c2VsZWN0IFFDT01fQ09NTUFORF9EQiBmb3IgQVJDSF9RQ09NIHRhcmdldHMgdG8gbWFrZSBzdXJl
Cj4gaXQgZG9lc24ndCBnZXQgbWlzc2VkIHdoZW4gd2UgbmVlZCBpdCBmb3IgYTZ4eCB0YXJldHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9y
Zz4KPiAtLS0KPiAKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnIHwgMyArKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL0tj
b25maWcKPiBpbmRleCA5YzM3ZTRkLi4zYjIzMzRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZwo+IEBA
IC0xNCwxMSArMTQsMTIgQEAgY29uZmlnIERSTV9NU00KPiAgCXNlbGVjdCBTSE1FTQo+ICAJc2Vs
ZWN0IFRNUEZTCj4gIAlzZWxlY3QgUUNPTV9TQ00gaWYgQVJDSF9RQ09NCj4gKwlzZWxlY3QgUUNP
TV9DT01NQU5EX0RCIGlmIEFSQ0hfUUNPTQo+ICAJc2VsZWN0IFdBTlRfREVWX0NPUkVEVU1QCj4g
IAlzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKPiAgCXNlbGVjdCBTWU5DX0ZJ
TEUKPiAgCXNlbGVjdCBQTV9PUFAKPiAtCWRlZmF1bHQgeQo+ICsJZGVmYXVsdCBtCgpBcyBhIGdl
bmVyYWwgY29tbWVudCB0aGUgcmlnaHQgdGhpbmcgd291bGQgYmUgdG8gZHJvcCB0aGlzIGRlZmF1
bHQuCkFzIGl0IGlzIG5vdyB0aGUgS2NvbmZpZyBzYXlzIHRoYXQgd2hlbiBEUk0gaXMgc2VsZWN0
ZWQgdGhlbiBhbGwgb2YgdGhlCndvcmxkIHdvdWxkIHRoZW4gYWxzbyBnZXQgRFJNX01TTSwgd2hp
Y2ggb25seSBhIHNtYWxsIHBhcnQgb2YgdGhpcyB3b3JsZAp5b3Ugc2VlIGFueSBiZW5lZml0IGlu
LgpTbyB0aGV5IG5vdyBoYXZlIHRvIGRlLXNlbGVjdCBNU00uCgpLY29uZmlnIGhhczoKICAgIGRl
cGVuZHMgb24gQVJDSF9RQ09NIHx8IFNPQ19JTVg1IHx8IChBUk0gJiYgQ09NUElMRV9URVNUKQoK
U28gbWF5YmUgbm90IGFsbCBvZiB0aGUgd29ybGQgYnV0IGFsbCBRQ09NIG9yIElNWDUgdXNlcnMu
IE1heWJlIHRoZXkgYXJlIGFsbAppbnRlcmVzdGVkIGluIE1TTS4gT3RoZXJ3aXNlIHRoZSBkZWZh
dWx0IHNob3VsZCByYXRoZXIgYmUgZHJvcHBlZC4KSWYgdGhlcmUgaXMgYW55IGdvb2QgaGludHMg
dGhlbiB0aGUgaGVscCB0ZXh0IGNvdWxkIGFueXdheSB1c2Ugc29tZQpsb3ZlLCBhbmQgdGhlbiBh
ZGQgdGhlIGluZm8gdGhlcmUuCgpUaGUgb3RoZXIgY2hhbmdlIHdpdGggUUNPTV9DT01NQU5EX0RC
IHNlZW1zIG9uIHRoZSBvdGhlciBoYW5kIHRvIG1ha2UKc2Vuc2UgYnV0IHRoZW4gdGhpcyBpcyBh
bm90aGVyIHBhdGNoLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
