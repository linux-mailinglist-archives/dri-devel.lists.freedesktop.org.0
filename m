Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C737A7F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989F89322;
	Thu,  6 Jun 2019 17:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370A489322
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:06:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0D5F33B;
 Thu,  6 Jun 2019 19:06:34 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:06:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 10/20] arm64: dts: renesas: r8a7795: Add CMM units
Message-ID: <20190606170620.GQ12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-11-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-11-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840794;
 bh=yrw/9KOLoEUVWxEhMblAvAUvO3su/JSHGOAF3wrqZos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZsV1WhCgU4QaA18SYmc4GYiMvuzfyuBxRxk/+h3WdCWTzrsEemEipV2lFpzVt2yuk
 h8jiIcDTc7kWwsh98HZs9JdZ6MvagQbNaQpODV2JnJodoKbSFaqTPnC+qC0MhS+XP6
 HmWGsNs9YaFOHWrNHsrYV4Ra03LxC10EU/MdgRH0=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjoxMFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEgzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaSB8IDM2ICsrKysrKysrKysrKysr
KysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQo+IGluZGV4
IGFiZWFjMzA1OTM4My4uODNlZGQ5ZjEyY2FhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5NS5kdHNpCj4gQEAgLTI4MjUsNiArMjgyNSwzOCBAQAo+ICAJCQlyZW5lc2Fz
LGZjcCA9IDwmZmNwdmkxPjsKPiAgCQl9Owo+ICAKPiArCQljbW0wOiBjbW1AZmVhNDAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTQwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTE+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiArCQljbW0xOiBjbW1AZmVhNTAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTUwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+ICsKPiArCQljbW0yOiBjbW1AZmVhNjAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTYwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzA5PjsKPiArCQl9Owo+ICsKPiArCQljbW0zOiBjbW1AZmVhNzAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTcwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDg+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzA4PjsKPiArCQl9Owo+ICsKPiAgCQljc2kyMDogY3NpMkBmZWE4MDAwMCB7
Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk1LWNzaTIiOwo+ICAJCQlyZWcgPSA8
MCAweGZlYTgwMDAwIDAgMHgxMDAwMD47Cj4gQEAgLTMwMjgsOSArMzA2MCwxMSBAQAo+ICAJCQkJ
IDwmY3BnIENQR19NT0QgNzIyPiwKPiAgCQkJCSA8JmNwZyBDUEdfTU9EIDcyMT47Cj4gIAkJCWNs
b2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwo+IC0JCQl2c3BzID0g
PCZ2c3BkMCAwICZ2c3BkMSAwICZ2c3BkMiAwICZ2c3BkMCAxPjsKPiAgCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKPiAgCj4gKwkJCXZzcHMgPSA8JnZzcGQwIDAgJnZzcGQxIDAgJnZzcGQyIDAgJnZz
cGQwIDE+Owo+ICsJCQljbW1zID0gPCZjbW0wICZjbW0xICZjbW0yICZjbW0zPjsKPiArCj4gIAkJ
CXBvcnRzIHsKPiAgCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkJI3NpemUtY2VsbHMg
PSA8MD47Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
