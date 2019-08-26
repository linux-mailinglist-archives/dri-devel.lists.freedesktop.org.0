Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448159D958
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2D289DD3;
	Mon, 26 Aug 2019 22:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BCE89DD3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:43:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 377B69A4;
 Tue, 27 Aug 2019 00:43:44 +0200 (CEST)
Date: Tue, 27 Aug 2019 01:43:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190826224337.GL5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566859424;
 bh=Ft2t79/UsLexer01RGnEmaG21HIbugJ0/z9QPp7bb9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W0r/n9YWIJ8DBjacOulPrNVKTKOrHwbMRrmXuyZ7wVPKPeguMN2c56SnFbECMnJK+
 ThGOSPD6e1KQ7YH6RM4XnuSnDF4VJUL8ek6T5qYN3ARpUMenmmHxzSOdtBzVrXbkOy
 crEPEBGXTUXu6MiHz53Rectj1nGkwUteimstRSzk=
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

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpTaG91bGQgeW91IHNxdWFzaCB0
aGlzIHdpdGggdGhlIHBhdGNoZXMgdGhhdCBhZGQgQ01NIHVuaXRzIHRvIHRoZSBvdGhlcgpTb0Nz
ID8KCk9uIFN1biwgQXVnIDI1LCAyMDE5IGF0IDAzOjUxOjQzUE0gKzAyMDAsIEphY29wbyBNb25k
aSB3cm90ZToKPiBBZGQgQ01NIHVuaXRzIHRvIFJlbmVzYXMgUi1DYXIgTTMtVyBkZXZpY2UgdHJl
ZSBhbmQgcmVmZXJlbmNlIHRoZW0gZnJvbQo+IHRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29u
bmVjdGVkIHRvLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KCkFwYXJ0IGZyb20gdGhlIGlzc3VlIHBvaW50ZWQgb3V0IGJ5IEdlZXJ0
LAoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2
LmR0c2kgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTYuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0
c2kKPiBpbmRleCAzZGM5ZDczZjU4OWEuLjhkNzhlMWY5OGEyMyAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaQo+IEBAIC0yNjEzLDYgKzI2MTMsMzAgQEAKPiAg
CQkJcmVuZXNhcyxmY3AgPSA8JmZjcHZpMD47Cj4gIAkJfTsKPiAgCj4gKwkJY21tMDogY21tQGZl
YTQwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjsKPiArCQkJ
cmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzExPjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19P
Tj47Cj4gKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47Cj4gKwkJfTsKPiArCj4gKwkJY21tMTogY21t
QGZlYTUwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjsKPiAr
CQkJcmVnID0gPDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3BnIENQ
R19NT0QgNzEwPjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZ
U19PTj47Cj4gKwkJCXJlc2V0cyA9IDwmY3BnIDcxMD47Cj4gKwkJfTsKPiArCj4gKwkJY21tMjog
Y21tQGZlYTYwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjsK
PiArCQkJcmVnID0gPDAgMHhmZWE2MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3Bn
IENQR19NT0QgNzA5PjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FM
V0FZU19PTj47Cj4gKwkJCXJlc2V0cyA9IDwmY3BnIDcwOT47Cj4gKwkJfTsKPiArCj4gIAkJY3Np
MjA6IGNzaTJAZmVhODAwMDAgewo+ICAJCQljb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1j
c2kyIjsKPiAgCQkJcmVnID0gPDAgMHhmZWE4MDAwMCAwIDB4MTAwMDA+Owo+IEBAIC0yNzY2LDYg
KzI3OTAsNyBAQAo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAKPiAgCQkJdnNwcyA9IDwm
dnNwZDAgJnZzcGQxICZ2c3BkMj47Cj4gKwkJCWNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTI+Owo+
ICAKPiAgCQkJcG9ydHMgewo+ICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
