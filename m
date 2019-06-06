Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E511C37A88
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D218940F;
	Thu,  6 Jun 2019 17:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8E78940F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:07:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AE9333B;
 Thu,  6 Jun 2019 19:07:44 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:07:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 12/20] arm64: dts: renesas: r8a77990: Add CMM units
Message-ID: <20190606170730.GA27525@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-13-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-13-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840864;
 bh=jIgrrc/BYHMcZej8K1iYKUaWSzykg4ahNGIRZ7DmNec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LY084Z/iztQzTZlB9cTK88taqZNTrLsY3IUH74gm2Y+u9nP+FRlIwHpTTpzlBw/E4
 PrXNgmyeOTUGEt9LgdyhwW2E0j0F4YTUkbIRxD2aPXo4xO3D/Oj8b4BBWmmEFbl0W0
 FDAK39WC+auueEBPc23u0qbYcGUYhewo6yC6D+v8=
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
OSBhdCAwNDoyMjoxMlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEUzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgfCAyMCArKysrKysrKysrKysr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpCj4gaW5kZXgg
YTY5ZmFhNjBlYTRkLi44NzQ1M2RkYmM3ZTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5OTAuZHRzaQo+IEBAIC0xNjU2LDYgKzE2NTYsMjIgQEAKPiAgCQkJaW9tbXVz
ID0gPCZpcG1tdV92aTAgOT47Cj4gIAkJfTsKPiAgCj4gKwkJY21tMDogY21tQGZlYTQwMDAwIHsK
PiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsKPiArCQkJcmVnID0gPDAgMHhm
ZWE0MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzExPjsKPiAr
CQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5MF9QRF9BTFdBWVNfT04+Owo+ICsJCQly
ZXNldHMgPSA8JmNwZyA3MTE+Owo+ICsJCX07Cj4gKwo+ICsJCWNtbTE6IGNtbUBmZWE1MDAwMCB7
Cj4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7Cj4gKwkJCXJlZyA9IDwwIDB4
ZmVhNTAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMD47Cj4g
KwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTBfUERfQUxXQVlTX09OPjsKPiArCQkJ
cmVzZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+ICsKPiAgCQljc2k0MDogY3NpMkBmZWFhMDAw
MCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk5MC1jc2kyIiwgInJlbmVzYXMs
cmNhci1nZW4zLWNzaTIiOwo+ICAJCQlyZWcgPSA8MCAweGZlYWEwMDAwIDAgMHgxMDAwMD47Cj4g
QEAgLTE2OTUsOSArMTcxMSwxMSBAQAo+ICAJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcyND4s
Cj4gIAkJCQkgPCZjcGcgQ1BHX01PRCA3MjM+Owo+ICAJCQljbG9jay1uYW1lcyA9ICJkdS4wIiwg
ImR1LjEiOwo+IC0JCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwPjsKPiAgCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiAgCj4gKwkJCXZzcHMgPSA8JnZzcGQwIDAgJnZzcGQxIDA+Owo+ICsJCQlj
bW1zID0gPCZjbW0wICZjbW0xPjsKPiArCj4gIAkJCXBvcnRzIHsKPiAgCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ICAJCQkJI3NpemUtY2VsbHMgPSA8MD47CgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
