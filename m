Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B24B7FB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 14:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01B6E386;
	Wed, 19 Jun 2019 12:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39A86E386
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:18:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9965320025;
 Wed, 19 Jun 2019 14:18:47 +0200 (CEST)
Date: Wed, 19 Jun 2019 14:18:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Message-ID: <20190619121846.GA29084@ravnborg.org>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190611215554.GA23791@bogus> <1560329392.1823.1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560329392.1823.1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8
 a=ER_8r6IbAAAA:8 a=p6pI0oa4AAAA:8 a=GHe269Cog9DItrN4tF0A:9
 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9LHmKk7ezEChjTCyhBa9:22
 a=9cw2y2bKwytFd151gpuR:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, Artur Rojek <contact@artur-rojek.eu>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, od@zcrc.me,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6NDk6NTJBTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSBtYXIuIDExIGp1aW4gMjAxOSDDoCAyMzo1NSwgUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4gYSDDqWNyaXQgOgo+ID4gT24gTW9uLCAgMyBKdW4gMjAxOSAxNzoy
MzozMCArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4gIEFkZCBkb2N1bWVudGF0aW9u
IGZvciB0aGUgZGV2aWNldHJlZSBiaW5kaW5ncyBvZiB0aGUgTENEIGNvbnRyb2xsZXIKPiA+ID4g
cHJlc2VudCBpbgo+ID4gPiAgdGhlIEpaNDd4eCBmYW1pbHkgb2YgU29DcyBmcm9tIEluZ2VuaWMu
Cj4gPiA+IAo+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+Cj4gPiA+ICBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJv
amVrLmV1Pgo+ID4gPiAgLS0tCj4gPiA+IAo+ID4gPiAgTm90ZXM6Cj4gPiA+ICAgICAgdjI6IFJl
bW92ZSBpbmdlbmljLHBhbmVsIHByb3BlcnR5Lgo+ID4gPiAKPiA+ID4gICAgICB2MzogLSBSZW5h
bWUgY29tcGF0aWJsZSBzdHJpbmdzIGZyb20gaW5nZW5pYyxqejQ3WFgtZHJtIHRvCj4gPiA+IGlu
Z2VuaWMsano0N1hYLWxjZAo+ID4gPiAgICAgICAgICAtIFRoZSBpbmdlbmljLGxjZC1tb2RlIHBy
b3BlcnR5IGlzIG5vdyByZWFkIGZyb20gdGhlIHBhbmVsCj4gPiA+IG5vZGUgaW5zdGVhZAo+ID4g
PiAgICAgIAkgIG9mIGZyb20gdGhlIGRyaXZlciBub2RlCj4gPiA+IAo+ID4gPiAgICAgIHY0OiBS
ZW1vdmUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBjb21wbGV0ZWx5Lgo+ID4gPiAKPiA+ID4g
ICAgICB2NTogTm8gY2hhbmdlCj4gPiA+IAo+ID4gPiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lu
Z2VuaWMsbGNkLnR4dCAgICAgICAgICB8IDQ0Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysKPiA+
ID4gICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ID4gPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NAo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9p
bmdlbmljLGxjZC50eHQKPiA+ID4gCj4gPiAKPiA+IFBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3
ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLAo+ID4gdGhlcmUn
cyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1
cHN0cmVhbQo+ID4gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVjZWl2ZWQgb24g
dGhlIHZlcnNpb24gdGhleSBhcHBseS4KPiA+IAo+ID4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBv
biBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCj4gCj4gU29ycnkg
Um9iLCBteSBtaXN0YWtlLiBJIHNpbXBseSBmb3Jnb3QgdGhhdCB5b3UgZXZlciByZXZpZXdlZCB0
aGF0IHBhdGNoLgpBZGRlZCBSb2IncyByLWIgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0CgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
