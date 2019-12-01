Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46610E11E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 10:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99336E02D;
	Sun,  1 Dec 2019 09:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE946E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 09:10:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A87B980656;
 Sun,  1 Dec 2019 10:09:43 +0100 (CET)
Date: Sun, 1 Dec 2019 10:09:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/panel: clean up indentation issue
Message-ID: <20191201090941.GA8753@ravnborg.org>
References: <20190925120357.10408-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925120357.10408-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=DfNHnWVPAAAA:8
 a=X4VG-in_caqo2OVBQ50A:9 a=CjuIK1q_8ugA:10 a=rjTVMONInIDnV1a_A2c_:22
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29saW4uCgpPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAwMTowMzo1N1BNICswMTAwLCBDb2xp
biBLaW5nIHdyb3RlOgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+Cj4gCj4gVGhlcmUgaXMgYSBjb250aW51ZSBzdGF0ZW1lbnQgdGhhdCBpcyBpbmRlbnRl
ZCBvbmUgbGV2ZWwgdG9vIGRlZXBseSwKPiByZW1vdmUgdGhlIGV4dHJhbmVvdXMgdGFiLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGlu
by5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1s
Y2Qtb2xpbnV4aW5vLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb2xpbWV4LWxjZC1v
bGludXhpbm8uYwo+IGluZGV4IDJiYWUxZGIzZmYzNC4uN2RkNjcyNjJhMmVkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGluby5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1sY2Qtb2xpbnV4aW5vLmMK
PiBAQCAtMTYxLDcgKzE2MSw3IEBAIHN0YXRpYyBpbnQgbGNkX29saW51eGlub19nZXRfbW9kZXMo
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gIAkJCQlsY2RfbW9kZS0+aGFjdGl2ZSwKPiAgCQkJ
CWxjZF9tb2RlLT52YWN0aXZlLAo+ICAJCQkJbGNkX21vZGUtPnJlZnJlc2gpOwo+IC0JCQkJY29u
dGludWU7Cj4gKwkJCWNvbnRpbnVlOwo+ICAJCX0KPiAgCj4gIAkJbW9kZS0+Y2xvY2sgPSBsY2Rf
bW9kZS0+cGl4ZWxjbG9jazsKClRoYW5rcywgdGhpcyBpcyB0aGUga2luZCBvZiBpc3N1ZXMgdGhh
dCBjYW4gZm9vbCBvbmUgb3IgdGFrZQpmb2N1cyBhd2F5IHdoZW4gcmVhZGluZyBjb2RlLgoKQXBw
bGllZCB0byBkcm0tbWlzYy1uZXh0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
