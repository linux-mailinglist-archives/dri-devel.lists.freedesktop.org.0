Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9E12B09
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07AB8916D;
	Fri,  3 May 2019 09:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D41C884E2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:50:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F09D4374;
 Fri,  3 May 2019 02:50:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEBF73F557;
 Fri,  3 May 2019 02:50:26 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 09BAE680137; Fri,  3 May 2019 10:50:25 +0100 (BST)
Date: Fri, 3 May 2019 10:50:24 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PULL] 2nd pull for malidp-next
Message-ID: <20190503095024.GD15144@e110455-lin.cambridge.arm.com>
References: <20190502104548.GX15144@e110455-lin.cambridge.arm.com>
 <CAPM=9txjGu8NxGROVcfRuZ_PhqY8Q2VHZaA_1cuwO9K3wccG6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9txjGu8NxGROVcfRuZ_PhqY8Q2VHZaA_1cuwO9K3wccG6g@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 James Qian Wang <james.qian.wang@arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 MaliDP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDk6NTQ6MzVBTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gVGh1LCAyIE1heSAyMDE5IGF0IDIwOjQ1LCBMaXZpdSBEdWRhdSA8TGl2aXUuRHVk
YXVAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgRFJNIG1haW50YWluZXJzLAo+ID4KPiA+IFRo
aXMgaXMgdGhlIDJuZCBwdWxsIHJlcXVlc3QgZm9yIHRoZSBtYWxpZHAtbmV4dC4gVGhlIG5ldyBw
YXRjaGVzIGFkZAo+ID4gYWRkaXRpb25hbCBzdXBwb3J0IGZvciBBcm0gTWFsaSBENzEgc28gdGhh
dCBpdCBjYW4gbm93IGJlIGVuYWJsZWQKPiA+IGNvcnJlY3RseSBhbmQgYnJvdWdodCB1cCBvbiBh
bnkgU29DIHRoYXQgY29udGFpbnMgdGhlIElQLiBGcm9tIG5vdyBvbgo+ID4gd2Ugd2lsbCBzdGFy
dCBmb2N1c2luZyBvbiBhZGRpbmcgd3JpdGViYWNrLCBzY2FsaW5nIGFuZCBvdGhlciB1c2VmdWwK
PiA+IGZlYXR1cmVzIHRvIGJyaW5nIHRoZSBkcml2ZXIgdG8gdGhlIHNhbWUgbGV2ZWwgb2YgbWF0
dXJpdHkgYXMgbWFsaS1kcC4KPiA+Cj4gPiBQbGVhc2UgcHVsbCwKPiA+IExpdml1Cj4gPgo+ID4K
PiA+Cj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDdjMTNlNWNjMjM5MTk1
MDU0MWY0MWZjOWFiMDMzNmFhZTc3YzdmNjM6Cj4gPgo+ID4gICBNZXJnZSB0YWcgJ2RybS1pbnRl
bC1uZXh0LWZpeGVzLTIwMTktMDQtMjUnIG9mIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0taW50ZWwgaW50byBkcm0tbmV4dCAoMjAxOS0wNC0yNiAxMTozNTo1OSArMTAwMCkK
PiA+Cj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+Cj4gPiAg
IGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQuZ2l0IGZvci11cHN0cmVhbS9tYWxpLWRwCj4g
Cj4gVGhpcyBicmFuY2ggY29udGFpbnM6Cj4gY29tbWl0IDA0YzhhMWVjMzk1YjIyZjA2MGI4MzZi
NzJkMmQ0NDgwZTdlODU5ZjgKPiBBdXRob3I6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0u
Y29tPgo+IERhdGU6ICAgVHVlIE1hciAyNiAxMDoyMzo0MCAyMDE5ICswMDAwCj4gCj4gICAgIE1B
SU5UQUlORVJTOiBGaXggcGF0dGVybiBmb3IgRG9jdW1lbnRhdGlvbiBwYXRoIGZvciBBcm0gTWFs
aSBLb21lZGEKPiAKPiBhcyBpdCdzIGhlYWQsIGRpZCB5b3UgZm9yZ2V0IHRvIHB1c2g/CgpTb3Jy
eSBhYm91dCB0aGF0LCBpdCBsb29rcyBsaWtlIEkndmUgaGVhZCBhbm90aGVyIHJlZnNwZWMgd2l0
aCB0aGUgc2FtZQpuYW1lLCBpdCBzaG91bGQgaGF2ZSBwb2ludGVkIHRvIHJlZnMvaGVhZHMvZm9y
LXVwc3RyZWFtL21hbGktZHAuIEkKc2hvdWxkIGhhdmUgbm93IHNvcnRlZCBpdC4KCkJlc3QgcmVn
YXJkcywKTGl2aXUKCgo+IAo+IERhdmUuCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdv
dWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBn
aXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAg
IMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
