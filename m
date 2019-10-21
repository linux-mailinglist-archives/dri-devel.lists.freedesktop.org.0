Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0EDF7E8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5C56E296;
	Mon, 21 Oct 2019 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 077E26E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 17:10:18 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id C5A3980CC;
 Mon, 21 Oct 2019 17:10:50 +0000 (UTC)
Date: Mon, 21 Oct 2019 10:10:13 -0700
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191021171013.GX5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:16 +0000
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
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTEwMjEgMTU6NDZd
Ogo+ID4gQW0gMjEuMTAuMjAxOSB1bSAxNzowNyBzY2hyaWViIFJvYiBIZXJyaW5nIDxyb2JoK2R0
QGtlcm5lbC5vcmc+Ogo+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTo0NiBQTSBILiBOaWtv
bGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IHdyb3RlOgo+ID4+ICstIHJlZzogICAg
ICAgICBQaHlzaWNhbCBiYXNlIGFkZHJlc3NlcyBhbmQgbGVuZ3RocyBvZiB0aGUgcmVnaXN0ZXIg
YXJlYXMuCj4gPiAKPiA+IEhvdyBtYW55Pwo+IAo+IEkgYXNzdW1lIHRoZXJlIGlzIG9ubHkgb25l
LiBBdCBsZWFzdCBpdCBzdWZmaWNlcyB0byBtYWtlIHRoZSBleGlzdGluZwo+IGRyaXZlciB3b3Jr
IHdpdGggaXQuCj4gCj4gPiAKPiA+PiArLSByZWctbmFtZXM6ICAgTmFtZXMgZm9yIHRoZSByZWdp
c3RlciBhcmVhcy4KPiA+IAo+ID4gSWYgb25seSAxIGFzIHRoZSBleGFtcGxlIHN1Z2dlc3RzLCB0
aGVuIHlvdSBkb24ndCBuZWVkIHRoaXMuCj4gCj4gb2suCgpNeSBndWVzcyBpcyB0aGF0IHNneCBp
cyBqdXN0IGEgcHJpdmF0ZSBpbnRlcmNvbm5lY3QgaW5zdGFuY2UKd2l0aCBmZXcgY29udHJvbCBt
b2R1bGVzIGxpa2UgbW11IGFuZCBjbG9ja3MsIGFuZCB0aGUgZHJpdmVyKHMpCnNob3VsZCBjb25z
aXN0IG9mIGluZGVwZW5kZW50IG1vZHVsZXMgbGlrZSBpb21tdSBhbmQgY2xvY2sKZHJpdmVyLgoK
U28geWVhaCBJIGFncmVlLCBpdCdzIGJlc3QgdG8gbGVhdmUgcmVnIG5hbWVzIG91dCBvZiB0aGUK
ZHRzIGF0IGxlYXN0IGZvciBub3cuCgo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAidGksc3lzYy1vbWFwNCIsICJ0aSxzeXNjIjsKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHg1NjAwZmUwMCAweDQ+LAo+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwweDU2MDBmZTEwIDB4ND47Cj4gPiAKPiA+IEhvdyBkb2VzIGl0IHdvcmsgdGhh
dCB0aGVzZSByZWdpc3RlcnMgb3ZlcmxhcCB0aGUgR1BVIHJlZ2lzdGVycz8KPiAKPiBCb3RoIGRy
aXZlcnMgaGF2ZSBhY2Nlc3MgdG8gdGhlc2UgcmVnaXN0ZXJzLiBMaWtlbHksIHRoZSBncHUgZHJp
dmVyCj4gaWdub3JlcyB0aGVtIGFuZCBkb2VzIGFjY2VzcyBvdGhlciByYW5nZXMuCgpVbmZvcnR1
bmF0ZWx5IFRJIGlzIHN0dWZmaW5nIHRoZSBpbnRlcmNvbm5lY3QgdGFyZ2V0IG1vZHVsZQpjb250
cm9sIHJlZ2lzdGVycyBhdCByYW5kb20gcGxhY2VzIHdpdGhpbiB0aGUgdW51c2VkIHJlZ2lzdGVy
CnNwYWNlIG9mIHRoZSBjaGlsZCBtb2R1bGUocykuIFNvIHRoZSBtb2R1bGUgY29udHJvbCByZWdp
c3RlcnMKYXJlIGFsbCBvdmVyIHRoZSBtYXAgYXQgdmFyaW91cyBvZmZzZXRzLgoKQWRkaW5nIGhv
bGVzIGZvciBlYWNoIG1vZHVsZSBjb250cm9sIHJlZ2lzdGVyIHRvIHRoZSBjaGlsZCBub2Rlcwpz
ZWVtcyBsaWtlIGFuIG92ZXJraWxsIHRvIHdvcmsgYXJvdW5kIHRoaXMgSU1PLiBFc3BlY2lhbGx5
CmNvbnNpZGVyaW5nIG1hbnkgZHJpdmVycyBvbmx5IHVuZGVyc3RhbmQgb25lIElPIHJhbmdlIGN1
cnJlbnRseS4KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
