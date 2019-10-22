Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C638E0021
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE44E6E49F;
	Tue, 22 Oct 2019 08:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C526E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:58:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id DA5E828C230
From: Rohan Garg <rohan.garg@collabora.com>
To: kernel@lists.collabora.co.uk
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
Date: Tue, 22 Oct 2019 10:58:08 +0200
Message-ID: <1754280.Wdm9FJ3adj@saphira>
In-Reply-To: <41425496-d121-8d51-991e-b3025b787c49@suse.de>
References: <20191011143009.17503-1-rohan.garg@collabora.com>
 <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
 <41425496-d121-8d51-991e-b3025b787c49@suse.de>
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzCk9uIHZpZXJuZXMsIDExIGRlIG9jdHVicmUgZGUgMjAxOSAxOTo1NTozNiAoQ0VT
VCkgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMS4xMC4xOSB1bSAxOTow
OSBzY2hyaWViIERhbmllbCBTdG9uZToKPiA+IEhpIFJvaGFuLAo+ID4gCj4gPiBPbiBGcmksIDEx
IE9jdCAyMDE5IGF0IDE1OjMwLCBSb2hhbiBHYXJnIDxyb2hhbi5nYXJnQGNvbGxhYm9yYS5jb20+
IHdyb3RlOgo+ID4+IERSTV9JT0NUTF9EVU1CX1NFVF9MQUJFTCBsZXRzIHlvdSBsYWJlbCBHRU0g
b2JqZWN0cywgbWFraW5nIGl0Cj4gPj4gZWFzaWVyIHRvIGRlYnVnIGlzc3VlcyBpbiB1c2Vyc3Bh
Y2UgYXBwbGljYXRpb25zLgo+ID4gCj4gPiBJJ20gbm90IHN1cmUgaWYgdGhpcyB3YXMgcG9pbnRl
ZCBvdXQgYWxyZWFkeSwgYnV0IGR1bWIgYnVmZmVycyAhPSBHRU0KPiA+IGJ1ZmZlcnMuIEdFTSBi
dWZmZXJzIF9jYW5fIGJlIGR1bWIsIGJ1dCBtaWdodCBub3QgYmUuCj4gPiAKPiA+IENvdWxkIHlv
dSBwbGVhc2UgcmVuYW1lIHRvIEdFTV9TRVRfTEFCRUw/Cj4gCj4gVGhpcyBjaGFuZ2UgdG8gYnVp
bGQgdXBvbiBkdW1iIGJ1ZmZlcnMgd2FzIHN1Z2dlc3RlZCBieSBtZSwgYXMgZHVtYgo+IGJ1ZmZl
cnMgaXMgdGhlIGNsb3NlcyB0aGluZyB0aGVyZSBpcyB0byBhIGJ1ZmZlciBtYW5hZ2VtZW50IGlu
dGVyZmFjZS4KPiBEcml2ZXJzIHdpdGggJ3NtYXJ0IGJ1ZmZlcnMnIHdvdWxkIGhhdmUgdG8gYWRk
IHRoZWlyIG93biBpb2N0bCBpbnRlcmZhY2VzLgo+IAo+IFdoYXQgSSByZWFsbHkgbWlzcyBoZXJl
IGlzIGEgdXNlcnNwYWNlIGFwcGxpY2F0aW9uIHRoYXQgdXNlcyB0aGlzCj4gZnVuY3Rpb25hbGl0
eS4gSXQgd291bGQgYmUgbXVjaCBlYXNpZXIgdG8gZGlzY3VzcyBpZiB0aGVyZSB3YXMgYW4gYWN0
dWFsCj4gZXhhbXBsZS4KPiAKCkknbSBjdXJyZW50bHkgd29ya2luZyBvbiBpbXBsZW1lbnRpbmcg
c29tZXRoaW5nIGZvciBNZXNhLiBJJ2xsIHNlbmQgYSB2NSBiYXNlZCAKb24gdGhlIGxlc3NvbnMg
bGVhcm50IGZyb20gdGhhdCBwYXRjaHNldC4KCj4gQmVzdCByZWdhcmRzCj4gCj4gPiBDaGVlcnMs
Cj4gPiBEYW5pZWwKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
