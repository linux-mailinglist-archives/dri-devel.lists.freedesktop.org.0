Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0779D976
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05EB6E328;
	Mon, 26 Aug 2019 22:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B286E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:47:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0A919A4;
 Tue, 27 Aug 2019 00:47:07 +0200 (CEST)
Date: Tue, 27 Aug 2019 01:47:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 06/14] arm64: dts: renesas: r8a77990: Add CMM units
Message-ID: <20190826224701.GO5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-7-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566859628;
 bh=UUfrMgBcWe0PKFIoCXq3mC/9UVbL71FyAHdWiQRpF64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KejAmg73izjKvQsJrXSnRlITStbYl7R6rIBji0QZt1ndhM472zrPT4sA8F9YbI/Xn
 GhhkI+Q/tsivPppRR4gNOtCYMmIK+7JaPcqOk01rX17aRcXuIgoplruJ2uMKVBFurR
 VDCArjoYyOxl8W1yVZ7T6309yfSI18RK99APnRIo=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEF1ZyAyNSwgMjAx
OSBhdCAwMzo1MTo0NlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEUzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpBcGFydCBmcm9tIHRoZSBpc3N1ZSB3
aXRoIGNvbXBhdGlibGUgc3RyaW5nIGFzIHBvaW50ZWQgb3V0IGZvciBwYXRjaAowMy8xNCwKClJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRz
aSB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3OTkwLmR0c2kKPiBpbmRleCA0NTU5NTRjM2Q5OGUuLjg5ZWJlNmY1NjVhZiAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpCj4gQEAgLTE3MjcsNiArMTcy
NywyMiBAQAo+ICAJCQlpb21tdXMgPSA8JmlwbW11X3ZpMCA5PjsKPiAgCQl9Owo+ICAKPiArCQlj
bW0wOiBjbW1AZmVhNDAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4YTc3
OTkwIjsKPiArCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9
IDwmY3BnIENQR19NT0QgNzExPjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5
MF9QRF9BTFdBWVNfT04+Owo+ICsJCQlyZXNldHMgPSA8JmNwZyA3MTE+Owo+ICsJCX07Cj4gKwo+
ICsJCWNtbTE6IGNtbUBmZWE1MDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0t
cjhhNzc5OTAiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xv
Y2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4
QTc3OTkwX1BEX0FMV0FZU19PTj47Cj4gKwkJCXJlc2V0cyA9IDwmY3BnIDcxMD47Cj4gKwkJfTsK
PiArCj4gIAkJY3NpNDA6IGNzaTJAZmVhYTAwMDAgewo+ICAJCQljb21wYXRpYmxlID0gInJlbmVz
YXMscjhhNzc5OTAtY3NpMiI7Cj4gIAkJCXJlZyA9IDwwIDB4ZmVhYTAwMDAgMCAweDEwMDAwPjsK
PiBAQCAtMTc2OCw5ICsxNzg0LDExIEBACj4gIAkJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUu
MSI7Cj4gIAkJCXJlc2V0cyA9IDwmY3BnIDcyND47Cj4gIAkJCXJlc2V0LW5hbWVzID0gImR1LjAi
Owo+IC0JCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPjsKPiAgCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKPiAgCj4gKwkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+Owo+ICsJCQlj
bW1zID0gPCZjbW0wICZjbW0xPjsKPiArCj4gIAkJCXBvcnRzIHsKPiAgCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ICAJCQkJI3NpemUtY2VsbHMgPSA8MD47CgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
