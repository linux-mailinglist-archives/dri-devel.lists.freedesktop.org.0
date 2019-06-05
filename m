Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963C360A7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 17:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1E89C1E;
	Wed,  5 Jun 2019 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8852989C1E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 15:58:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 682AB3084268;
 Wed,  5 Jun 2019 15:58:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F03211018A2C;
 Wed,  5 Jun 2019 15:58:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D145016E1A; Wed,  5 Jun 2019 17:58:47 +0200 (CEST)
Date: Wed, 5 Jun 2019 17:58:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
Message-ID: <20190605155847.gabpvcoc6zf3twfv@sirius.home.kraxel.org>
References: <20190604111330.25324-1-tzimmermann@suse.de>
 <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
 <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 05 Jun 2019 15:58:55 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMTE6NTk6MDRBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNS4wNi4xOSB1bSAxMTowMyBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPiBPbiBUdWUsIEp1biAwNCwgMjAxOSBhdCAwMToxMzozMFBNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBUaGUgZG9jdW1lbnRhdGlvbiB0b29scyBpbnRlcnBy
ZXQgZHJtX2dlbV92cmFtX21tX2Z1bmNzIGFzIGZ1bmN0aW9uIGFuZAo+ID4+IHRoZXJlIGFwcGVh
cnMgdG8gYmUgbm8gd2F5IG9mIGlubGluZS1kb2N1bWVudGluZyBjb25zdGFudHMuCj4gPiAKPiA+
PiAtLyoqCj4gPj4gKy8qCj4gPj4gICAqIGRybV9nZW1fdnJhbV9tbV9mdW5jcyAtIEZ1bmN0aW9u
cyBmb3IgJnN0cnVjdCBkcm1fdnJhbV9tbQo+ID4gCj4gPiAic3RydWN0IGRybV9nZW1fdnJhbV9t
bV9mdW5jcyIgPwo+ID4gCj4gPiAoc2VlIGluY2x1ZGUvZHJtL2RybV9nZW0uaCB3aGVyZSBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgaXMKPiA+IGRvY3VtZW50ZWQgdGhhdCB3YXkpLgo+IAo+
IFRoZSBkb2N1bWVudGVkIHNvdXJjZSBsaW5lIGlzCj4gCj4gICBjb25zdCBzdHJ1Y3QgZHJtX3Zy
YW1fbW1fZnVuY3MgZHJtX2dlbV92cmFtX21tX2Z1bmNzID0gewo+IAo+IGFuZCBJIHRyaWVkIHRv
IGRvY3VtZW50IHRoZSBwdXJwb3NlIG9mIHRoZSBjb25zdGFudCAnZHJtX2dlbV92cmFtX21tX2Z1
bmNzJy4KCkFoLiAgTWlzc2VkIHRoYXQgZGV0YWlsLgoKPiBEb2N1bWVudGluZyBnbG9iYWwgY29u
c3RhbnRzIGlzIG5vdCBkZXNjcmliZWQgaW4gdGhlIGtlcm5lbCBndWlkZSBhbmQgSQo+IGNvdWxk
IG5vdCBmaW5kIGEgc291cmNlLWNvZGUgZXhhbXBsZSBlaXRoZXIuIEZ1bmN0aW9uIGFuZCBzdHJ1
Y3Qgc3R5bGUKPiB3aXRoICctJyBkaWRuJ3Qgd29yazsgbWVtYmVyLWZpZWxkIHN0eWxlIHdpdGgg
J0AnIG5laXRoZXIuIFRoZSBvbmx5IHdheQo+IHNlZW1zIHRvIGJlIGFkZGluZyBpdCB0byBhbiAu
cnN0IGZpbGUgaW4gRG9jdW1lbnRhdGlvbi4gQnV0IHRoZW4gaXQncwo+IG5vdCBwYXJ0IG9mIHRo
ZSBBUEkgZG9jdW1lbnRhdGlvbiwgYnV0IHNvbWV3aGVyZSBpbiB0aGUgdGV4dC4KCk9rLCBwYXRj
aCBpcyBmaW5lIHRoZW4uCgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+CgooY2FuIHlvdSBjb21taXQgJiBwdXNoIHlvdXJzZWxmIG1lYW53aGlsZT8pCgpjaGVlcnMs
CiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
