Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CABDF7EE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21E56E29E;
	Mon, 21 Oct 2019 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F2996E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 17:26:02 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 95D3A810A;
 Mon, 21 Oct 2019 17:26:35 +0000 (UTC)
Date: Mon, 21 Oct 2019 10:25:57 -0700
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191021172557.GB5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
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
bGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IHdyb3RlOgo+ID4+ICtPcHRpb25hbCBw
cm9wZXJ0aWVzOgo+ID4+ICstIHRpbWVyOiAgICAgICB0aGUgdGltZXIgdG8gYmUgdXNlZCBieSB0
aGUgZHJpdmVyLgo+ID4gCj4gPiBOZWVkcyBhIGJldHRlciBkZXNjcmlwdGlvbiBhbmQgdmVuZG9y
IHByZWZpeCBhdCBsZWFzdC4KPiAKPiBJIGFtIG5vdCB5ZXQgc3VyZSBpZiBpdCBpcyB2ZW5kb3Ig
c3BlY2lmaWMgb3IgaWYgYWxsCj4gU0dYIGltcGxlbWVudGF0aW9ucyBuZWVkIHNvbWUgdGltZXIu
Cj4gCj4gPiAKPiA+IFdoeSBpcyB0aGlzIG5lZWRlZCByYXRoZXIgdGhhbiB1c2luZyB0aGUgT1Mn
cyB0aW1lcnM/Cj4gCj4gQmVjYXVzZSBub2JvZHkgdW5kZXJzdGFuZHMgdGhlIGN1cnJlbnQgKG91
dCBvZiB0cmVlIGFuZAo+IHBsYW5uZWQgZm9yIHN0YWdpbmcpIGRyaXZlciB3ZWxsIGVub3VnaCB3
aGF0IHRoZSB0aW1lcgo+IGlzIGRvaW5nLiBJdCBpcyBjdXJyZW50bHkgaGFyZCBjb2RlZCB0aGF0
IHNvbWUgb21hcCByZWZlcgo+IHRvIHRpbWVyNyBhbmQgb3RoZXJzIHVzZSB0aW1lcjExLgoKSnVz
dCBjb25maWd1cmUgaXQgaW4gdGhlIGRyaXZlciBiYXNlZCBvbiB0aGUgY29tcGF0aWJsZQp2YWx1
ZSB0byBrZWVwIGl0IG91dCBvZiB0aGUgZHRzLiBJdCdzIGJlc3QgdG8gc3RpY2sgdG8Kc3RhbmRh
cmQgYmluZGluZ3MuCgo+ID4+ICstIGltZyxjb3JlczogICBudW1iZXIgb2YgY29yZXMuIERlZmF1
bHRzIHRvIDwxPi4KPiA+IAo+ID4gTm90IGRpc2NvdmVyYWJsZT8KPiAKPiBOb3Qgc3VyZSBpZiBp
dCBpcy4gVGhpcyBpcyBwcm9iYWJseSBhdmFpbGFibGUgaW4gdW5kb2N1bWVudGVkCj4gcmVnaXN0
ZXJzIG9mIHRoZSBzZ3guCgpUaGlzIHRvbywgYW5kIHdoYXRldmVyIG5vbi1zdGFuZHJkIG90aGVy
IHByb3Blcml0aWVzCnlvdSBtaWdodCBoYXZlLgoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
