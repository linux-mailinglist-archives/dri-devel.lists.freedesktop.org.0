Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BF109A00
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377636E24B;
	Tue, 26 Nov 2019 08:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id E699089E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 15:46:27 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 3A89A80EA;
 Mon, 25 Nov 2019 15:47:02 +0000 (UTC)
Date: Mon, 25 Nov 2019 07:46:21 -0800
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
Message-ID: <20191125154621.GY35479@atomide.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
 <1574600246.3.0@crapouillou.net>
 <20191124174837.GX35479@atomide.com>
 <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, Paul Boddie <paul@boddie.org.uk>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTExMjQgMTg6MDBd
Ogo+IEhpIFBhdWwsIFRvbnksCj4gCj4gPiBBbSAyNC4xMS4yMDE5IHVtIDE4OjQ4IHNjaHJpZWIg
VG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT46Cj4gPiAKPiA+ICogUGF1bCBDZXJjdWVp
bCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+IFsxOTExMjQgMTI6NThdOgo+ID4+IExlIGRpbS4sIG5v
di4gMjQsIDIwMTkgYXQgMTI6NDAsIEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNv
LmNvbT4gYQo+ID4+IMOpY3JpdCA6Cj4gPj4+IGFuZCBhZGQgaW50ZXJydXB0IGFuZCBjbG9ja3Mu
Cj4gPiAuLi4KPiA+Pj4gLS0tIGEvYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMvano0NzgwLmR0
c2kKPiA+Pj4gKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMvano0NzgwLmR0c2kKPiA+
Pj4gQEAgLTQ2LDYgKzQ2LDE3IEBACj4gPj4+IAkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4+PiAJ
fTsKPiA+Pj4gCj4gPj4+ICsJZ3B1OiBncHVAMTMwNDAwMDAgewo+ID4+IAo+ID4+IFdlIHRyeSB0
byBrZWVwIHRoZSBub2RlcyBvcmRlcmVkIGJ5IGFkZHJlc3MsIGNvdWxkIHlvdSBtb3ZlIHRoaXMg
bm9kZSB3aGVyZQo+ID4+IGl0IGJlbG9uZ3M/Cj4gPiAuLi4KPiAKPiBZZXMsIEkgaGF2ZSBub3Rl
ZC4KPiAKPiA+IAo+ID4+PiArCQljb21wYXRpYmxlID0gImluZ2VuaWMsano0NzgwLXNneDU0MC0x
MjAiLCAiaW1nLHNneDU0MC0xMjAiLAo+ID4+PiAiaW1nLHNneDU0MCIsICJpbWcsc2d4NSI7Cj4g
Pj4+ICsJCXJlZyA9IDwweDEzMDQwMDAwIDB4NDAwMD47Cj4gPj4+ICsKPiA+Pj4gKwkJY2xvY2tz
ID0gPCZjZ3UgSlo0NzgwX0NMS19HUFU+Owo+ID4+PiArCQljbG9jay1uYW1lcyA9ICJncHUiOwo+
ID4gCj4gPiBKdXN0IGNoZWNraW5nLi4gSXMgdGhlcmUgc29tZXRoaW5nIGVsc2UgdG8gY29uZmln
dXJlIGhlcmUKPiA+IHBvdGVudGlhbGx5IGluIGFkZGl0aW9uIHRvIHRoZSBjbG9ja3M/Cj4gCj4g
SXQgZG9lc24ndCBsb29rIHNvLiBVbmZvcnR1YW50ZWx5IHRoZXJlIGlzbid0IG11Y2ggaW5mb3Jt
YXRpb24KPiBleGNlcHQgYSB2My4xOCBrZXJuZWwgc3VwcG9ydGVkIGJ5IHRoZSB2ZW5kb3IgYW5k
IHRoYXQgb25lIGFsc28KPiBqdXN0IGhhcyBhIGdwdSBub2RlIHdpdGggY2xvY2sgY29udHJvbC4K
PiAKPiA+IFRoYXQgaXMsIGRvIHdlIG5lZWQgdG8gZG8gc29tZSBpbnRlcmNvbm5lY3Qgc3BlY2lm
aWMKPiA+IGNvbmZpZ3VyYXRpb24gZXRjIGluIGFkZGl0aW9uIHRvIHRoZSBjbG9ja3MgdG8gaGF2
ZQo+ID4gcnVudGltZSBQTSB3b3JrIGZvciBlbmFibGluZyBhbmQgZGlzYWJsaW5nIHNneCBvbgo+
ID4gano0NzgwPwo+IAo+IEkgdGhpbmsgd2UgaGF2ZSB0byBsZWF2ZSB0aGF0IG9wZW4gZm9yIGZ1
cnRoZXIgc3R1ZHkuCgpPSyBmb3Igbm93LCBsZXQncyBhc3N1bWUgd2UganVzdCBuZWVkIHRvIGNh
bGwKY2xrX2VuYWJsZS9kaXNhYmxlIGZyb20gdGhlIFBNIHJ1bnRpbWUgZnVuY3Rpb25zIGlmIGEK
Y2xvY2sgZXhpc3RzLgoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
