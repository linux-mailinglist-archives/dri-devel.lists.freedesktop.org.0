Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED712A40
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37697893D1;
	Fri,  3 May 2019 09:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF5893D1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:11:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72EFC374;
 Fri,  3 May 2019 02:11:11 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417073F557;
 Fri,  3 May 2019 02:11:11 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 866BA68240E; Fri,  3 May 2019 10:11:09 +0100 (BST)
Date: Fri, 3 May 2019 10:11:09 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PULL] 2nd pull for malidp-next
Message-ID: <20190503091109.GA15144@e110455-lin.cambridge.arm.com>
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
aSBLb21lZGEKPiAKPiBhcyBpdCdzIGhlYWQsIGRpZCB5b3UgZm9yZ2V0IHRvIHB1c2g/CgpGcm9t
IG15IGhvbWUgY29tcHV0ZXIgSSBzZWUgYSBkaWZmZXJlbnQgY29tbWl0IGFzIHRoZSBoZWFkOgoK
CmNvbW1pdCA5NmY5NTc0NjY2ODYxZTdjNTkwMmQ0MTI0NzRkM2ZmMjgxMjNjN2QxIChsaXZpdS1h
cm0vZm9yLXVwc3RyZWFtL21hbGktZHApCkF1dGhvcjogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPgpEYXRlOiAgIFNhdCBBcHIgMjcgMDA6NDI6MDIgMjAxOSArMDgwMAoKICAgIGRy
bS9rb21lZGE6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdrY3J0YycKICAgIAog
ICAgRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgogICAgCiAg
ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jOiBJbiBm
dW5jdGlvbiBrb21lZGFfcGxhbmVfYXRvbWljX2NoZWNrOgogICAgZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzo0OToyMjogd2FybmluZzogdmFyaWFibGUg
a2NydGMgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICAgIAog
ICAgSXQgaXMgbmV2ZXIgdXNlZCBzaW5jZSBpbnRyb2R1Y3Rpb24gaW4KICAgIGNvbW1pdCA3ZDMx
YjllN2E1NTAgKCJkcm0va29tZWRhOiBBZGQga29tZWRhX3BsYW5lL3BsYW5lX2hlbHBlcl9mdW5j
cyIpCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KICAgIFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBMaXZpdSBE
dWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCgpNYXliZSByZXN5bmM/CgpCZXN0IHJlZ2FyZHMs
Ckxpdml1Cgo+IAo+IERhdmUuCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxp
a2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcg
bWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o
44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
