Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6437A82
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686FA893D0;
	Thu,  6 Jun 2019 17:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62011893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:07:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C1F333B;
 Thu,  6 Jun 2019 19:07:12 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:06:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 11/20] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190606170657.GR12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-12-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840832;
 bh=8jnTChS9a9/y2qNxbcbUHVURhtm0bSPBvqcESaDenko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u4RTer8NI0W4uXgRle1ZcKEoEY+i+uZmshkm7TGYP3qSdZK4BZenljRoneUmQAl4O
 FjPALEyS0lLVw9W7FydsZtSzJM/+j2mdQz3SrkzRYldWd+S7eCaYJpPytqCtNm8/44
 hz8SBUS3Kmi1pn0kgS187+lB1wvNX3xfNKt+CFfA=
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
OSBhdCAwNDoyMjoxMVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIE0zLU4gZGV2aWNlIHRyZWUgYW5kIHJlZmVyZW5jZSB0aGVtIGZy
b20KPiB0aGUgRGlzcGxheSBVbml0IHRoZXkgYXJlIGNvbm5lY3RlZCB0by4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
NjUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCj4gaW5k
ZXggOTc2M2QxMDhlMTgzLi5hOTA4NTQ2ODViMzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjhhNzc5NjUuZHRzaQo+IEBAIC0yMDI2LDYgKzIwMjYsMzAgQEAKPiAgCQkJcmVz
ZXRzID0gPCZjcGcgNjAyPjsKPiAgCQl9Owo+ICAKPiArCQljbW0wOiBjbW1AZmVhNDAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTQwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTE+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTY1X1BEX0FMV0FZU19PTj47Cj4gKwkJCXJl
c2V0cyA9IDwmY3BnIDcxMT47Cj4gKwkJfTsKPiArCj4gKwkJY21tMTogY21tQGZlYTUwMDAwIHsK
PiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsKPiArCQkJcmVnID0gPDAgMHhm
ZWE1MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzEwPjsKPiAr
CQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2NV9QRF9BTFdBWVNfT04+Owo+ICsJCQly
ZXNldHMgPSA8JmNwZyA3MTA+Owo+ICsJCX07Cj4gKwo+ICsJCWNtbTM6IGNtbUBmZWE3MDAwMCB7
Cj4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7Cj4gKwkJCXJlZyA9IDwwIDB4
ZmVhNzAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcwOD47Cj4g
KwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVfUERfQUxXQVlTX09OPjsKPiArCQkJ
cmVzZXRzID0gPCZjcGcgNzA4PjsKPiArCQl9Owo+ICsKPiAgCQljc2kyMDogY3NpMkBmZWE4MDAw
MCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2NS1jc2kyIjsKPiAgCQkJcmVn
ID0gPDAgMHhmZWE4MDAwMCAwIDB4MTAwMDA+Owo+IEBAIC0yMTc3LDYgKzIyMDEsNyBAQAo+ICAJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAKPiAgCQkJdnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEg
MCAmdnNwZDAgMT47Cj4gKwkJCWNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTM+Owo+ICAKPiAgCQkJ
cG9ydHMgewo+ICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
