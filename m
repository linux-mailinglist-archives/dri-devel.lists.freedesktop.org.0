Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB7A9D968
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE8E6E323;
	Mon, 26 Aug 2019 22:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443416E323
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:45:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B16ED9A4;
 Tue, 27 Aug 2019 00:45:15 +0200 (CEST)
Date: Tue, 27 Aug 2019 01:45:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 04/14] arm64: dts: renesas: r8a7795: Add CMM units
Message-ID: <20190826224509.GM5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-5-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566859515;
 bh=jloFnCXsdmid7nbWcqBHlxh0WvUy4xChhhtgh6+YJxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJF6t0Tx3bwckGq77CKAlYUxrp0E3NqRaSv8f3SyeuRnH7OvFoGikOGgBX3pPNEUL
 idGGwVzob0WjuyilGJgPH0c0cIxKeoe+AqswE8nOmlHv/M76OTP/7oYfh/iE/6CVVR
 GDkj6bZEOpyqP8OX60WS0U/kp8k4SZhDG7M0frXs=
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
OSBhdCAwMzo1MTo0NFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEgzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpBcGFydCBmcm9tIHRoZSBpc3N1ZSB3
aXRoIGNvbXBhdGlibGUgc3RyaW5nIGFzIHBvaW50ZWQgb3V0IGZvciBwYXRjaAowMy8xNCwKClJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNp
IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc5NS5kdHNpCj4gaW5kZXggOTVkZWZmNjZlZWI2Li4yMWI0MDY5ZjA3ZTcgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kKPiBAQCAtMjkwOSw2ICsyOTA5
LDM4IEBACj4gIAkJCWlvbW11cyA9IDwmaXBtbXVfdmkxIDEwPjsKPiAgCQl9Owo+ICAKPiArCQlj
bW0wOiBjbW1AZmVhNDAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4YTc3
OTUiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCA3MTE+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVf
UERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiAr
CQljbW0xOiBjbW1AZmVhNTAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4
YTc3OTUiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tz
ID0gPCZjcGcgQ1BHX01PRCA3MTA+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3
OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+ICsK
PiArCQljbW0yOiBjbW1AZmVhNjAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21t
LXI4YTc3OTUiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTYwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xv
Y2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4
QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzA5PjsKPiArCQl9Owo+
ICsKPiArCQljbW0zOiBjbW1AZmVhNzAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMs
Y21tLXI4YTc3OTUiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTcwMDAwIDAgMHgxMDAwPjsKPiArCQkJ
Y2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDg+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNj
IFI4QTc3OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzA4PjsKPiArCQl9
Owo+ICsKPiAgCQljc2kyMDogY3NpMkBmZWE4MDAwMCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOGE3Nzk1LWNzaTIiOwo+ICAJCQlyZWcgPSA8MCAweGZlYTgwMDAwIDAgMHgxMDAwMD47
Cj4gQEAgLTMxMTIsOSArMzE0NCwxMSBAQAo+ICAJCQkJIDwmY3BnIENQR19NT0QgNzIyPiwKPiAg
CQkJCSA8JmNwZyBDUEdfTU9EIDcyMT47Cj4gIAkJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUu
MSIsICJkdS4yIiwgImR1LjMiOwo+IC0JCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwg
PCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCj4g
KwkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+
Owo+ICsJCQljbW1zID0gPCZjbW0wICZjbW0xICZjbW0yICZjbW0zPjsKPiArCj4gIAkJCXBvcnRz
IHsKPiAgCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkJI3NpemUtY2VsbHMgPSA8MD47
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
