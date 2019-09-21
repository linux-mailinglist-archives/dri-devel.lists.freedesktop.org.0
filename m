Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93771BA25A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E196E885;
	Sun, 22 Sep 2019 12:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BA16E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 19:09:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 887AA2002D;
 Sat, 21 Sep 2019 21:09:42 +0200 (CEST)
Date: Sat, 21 Sep 2019 21:09:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new
 DRM panel
Message-ID: <20190921190941.GD32133@ravnborg.org>
References: <20190917161214.2913-1-aford173@gmail.com>
 <20190917161214.2913-3-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917161214.2913-3-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=4bu5KDIevAQmuqN_AgEA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 adam.ford@logicpd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbS4KCk9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDExOjEyOjEzQU0gLTA1MDAsIEFkYW0g
Rm9yZCB3cm90ZToKPiBXaXRoIHRoZSByZW1vdmFsIG9mIHRoZSBwYW5lbC1kcGkgZnJvbSB0aGUg
b21hcCBkcml2ZXJzLCB0aGUKPiBMQ0Qgbm8gbG9uZ2VyIHdvcmtzLiAgVGhpcyBwYXRjaCBwb2lu
dHMgdGhlIGRldmljZSB0cmVlIHRvCj4gYSBuZXdseSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dp
Y3BkLHR5cGUyOCIKPiAKPiBGaXhlczogOGJmNGIxNjIxMTc4ICgiZHJtL29tYXA6IFJlbW92ZSBw
YW5lbC1kcGkgZHJpdmVyIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTcz
QGdtYWlsLmNvbT4KTG9va3MgZ29vZC4KT25lIG5pdCBiZWxvdy4KCldpdGggdGhpcyBhZGRyZXNz
ZWQ6CgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKCVNhbQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZr
aXQtMjguZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0
LTI4LmR0cwo+IGluZGV4IDA3YWM5OWI5Y2RhNi4uMDBjNDI2YmQ1MWEwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0yOC5kdHMKPiAr
KysgYi9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRz
Cj4gQEAgLTExLDIyICsxMSw4IEBACj4gICNpbmNsdWRlICJsb2dpY3BkLXRvcnBlZG8tMzd4eC1k
ZXZraXQuZHRzIgo+ICAKPiAgJmxjZDAgewo+IC0KPiArCS8qIFRoaXMgaXNuJ3QgdGhlIGV4YWN0
IExDRCwgYnV0IHRoZSB0aW1pbmdzIG1lZXQgc3BlYyAqLwo+ICsJLyogVG8gbWFrZSBpdCB3b3Jr
LCBzZXQgQ09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0s9NCAqLwo+ICsJY29tcGF0aWJs
ZSA9ICJsb2dpY3BkLHR5cGUyOCI7Cj4gIAlsYWJlbCA9ICIyOCI7CllvdSBsZWZ0IHRoaXMgcHJv
cGVydHkgLSBidXQgdXMgaXQgZG9jdW1lbnRlZCBhbmQgd2hhdCB1c2UgaGFzIGl0PwoKPiAtCj4g
LQlwYW5lbC10aW1pbmcgewo+IC0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKPiAtCQlo
YWN0aXZlID0gPDQ4MD47Cj4gLQkJdmFjdGl2ZSA9IDwyNzI+Owo+IC0JCWhmcm9udC1wb3JjaCA9
IDwzPjsKPiAtCQloYmFjay1wb3JjaCA9IDwyPjsKPiAtCQloc3luYy1sZW4gPSA8NDI+Owo+IC0J
CXZiYWNrLXBvcmNoID0gPDM+Owo+IC0JCXZmcm9udC1wb3JjaCA9IDwyPjsKPiAtCQl2c3luYy1s
ZW4gPSA8MTE+Owo+IC0JCWhzeW5jLWFjdGl2ZSA9IDwxPjsKPiAtCQl2c3luYy1hY3RpdmUgPSA8
MT47Cj4gLQkJZGUtYWN0aXZlID0gPDE+Owo+IC0JCXBpeGVsY2xrLWFjdGl2ZSA9IDwwPjsKPiAt
CX07Cj4gIH07Cj4gLS0gCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
