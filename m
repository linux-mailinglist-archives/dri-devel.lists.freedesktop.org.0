Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93EE13C1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ED66E9BB;
	Wed, 23 Oct 2019 08:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82E966E088
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:36:54 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id EF18F80FA;
 Tue, 22 Oct 2019 15:37:27 +0000 (UTC)
Date: Tue, 22 Oct 2019 08:36:50 -0700
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191022153650.GL5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
 <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
 <20191022150202.GJ5610@atomide.com>
 <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
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

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTEwMjIgMTU6MTJd
Ogo+IEhtLiBIb3cgc2hvdWxkIHRoYXQgd29yaz8gU29tZSBTb0MgaGF2ZSB0aGUgc2d4NTQ0IGFz
IHNpbmdsZQo+IGNvcmUgYW5kIG90aGVycyBhcyBkdWFsIGNvcmUuIFRoaXMgaW1obyBkb2VzIG5v
dCBmaXQgaW50bwo+IHRoZSAiaW1nLHNneDU0NC0kcmV2aXNpb24iIHNjaGVtZSB3aGljaCBjb3Vs
ZCBiZSBtYXRjaGVkIHRvLgoKV2VsbCBkb24ndCB5b3UgaGF2ZSB0aGVuIGp1c3QgdHdvIHNlcGFy
YXRlIGNoaWxkIG5vZGVzLApvbmUgZm9yIGVhY2ggY29yZSB3aXRoIHRoZWlyIG93biByZWdpc3Rl
ciByYW5nZT8KClRoYXQgaXMgYXNzdW1pbmcgdGhleSdyZSByZWFsbHkgc2VwYXJhdGUgaW5zdGFu
Y2VzLi4KCj4gQnV0IG1heWJlIHdlIGRvIGl0IHRoZSBzYW1lIGFzIHdpdGggdGhlIHRpbWVyIGZv
ciB0aGUgbW9tZW50LAo+IGkuZS4ga2VlcCBpdCBpbiBzb21lIHVucHVibGlzaGVkIHBhdGNoIHNl
dC4KClllYWggbWFrZXMgc2Vuc2UgdG8gbWUgdW50aWwgdGhpbmdzIGdldCBzb3J0ZWQgb3V0LgoK
PiBBdCB0aGUgbW9tZW50IEkgaGF2ZSBtb3JlIHByb2JsZW1zIHVuZGVyc3RhbmRpbmcgaG93IHRo
ZSB5YW1sCj4gdGhpbmcgd29ya3MuIEkgdW5kZXJzdGFuZCBhbmQgZnVsbHkgc3VwcG9ydCB0aGUg
b3ZlcmFsbCBnb2FsLAo+IGJ1dCBpdCBpcyBxdWl0ZSBkaWZmaWN1bHQgdG8gZ2V0IGEgc3RhcnQg
aGVyZS4gQW5kIHRoZXJlIGRvIG5vdAo+IHNlZW0gdG8gYmUgdG9vbHMgb3Igc2NyaXB0cyB0byBo
ZWxwIGNvbnZlcnRpbmcgZnJvbSBvbGQgc3R5bGUKPiB0ZXh0IGZvcm1hdCAoZXZlbiBpZiBub3Qg
cGVyZmVjdCwgdGhpcyB3b3VsZCBiZSBoZWxwZnVsKSBhbmQKPiBJIGhhdmUgbm8geWFtbCBlZGl0
b3IgdGhhdCBoZWxwcyBrZWVwaW5nIHRoZSBpbmRlbnRhdGlvbgo+IGNvcnJlY3QuIFNvIHRoaXMg
c2xvd3MgZG93biBhIHYyIGEgbGl0dGxlIGJpdC4KClNvdW5kcyBoYW5keSB0byBtZSA6KQoKUmVn
YXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
