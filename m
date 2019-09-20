Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B0B9894
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72646FDDB;
	Fri, 20 Sep 2019 20:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs10.siol.net [185.57.226.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476DC6E086
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 3AB16521EC2;
 Fri, 20 Sep 2019 22:31:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id daZqV_zAxHsF; Fri, 20 Sep 2019 22:31:43 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id D37B5523A05;
 Fri, 20 Sep 2019 22:31:43 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 7B168523890;
 Fri, 20 Sep 2019 22:31:43 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: Re: drm/sun4i: Add missing pixel formats to the vi layer
Date: Fri, 20 Sep 2019 22:31:43 +0200
Message-ID: <12552832.EO9JtDEgEE@jernej-laptop>
In-Reply-To: <CAODwZ7uonAyhJAwZ+NFm_aHzC1Rzp=NyhQCu1h_85ecRxZ50cw@mail.gmail.com>
References: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
 <9229663.7SG9YZCNdo@jernej-laptop>
 <CAODwZ7uonAyhJAwZ+NFm_aHzC1Rzp=NyhQCu1h_85ecRxZ50cw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHBldGVrLCAyMC4gc2VwdGVtYmVyIDIwMTkgb2IgMjI6MjI6NDQgQ0VTVCBqZSBSb21hbiBT
dHJhdGlpZW5rbyAKbmFwaXNhbChhKToKPiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCA5OjUzIFBN
IEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+IAp3cm90ZToKPiA+IEhp
IQo+ID4gCj4gPiBEbmUgc3JlZGEsIDE4LiBzZXB0ZW1iZXIgMjAxOSBvYiAxMzowNTo0MSBDRVNU
IGplCj4gPiAKPiA+IHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbSBuYXBpc2FsKGEp
Ogo+ID4gPiBGcm9tOiBSb21hbiBTdHJhdGlpZW5rbyA8cm9tYW4uc3RyYXRpaWVua29AZ2xvYmFs
bG9naWMuY29tPgo+ID4gPiAKPiA+ID4gQWNjb3JkaW5nIHRvIEFsbHdpbm5lciBERTIuMCBTcGVj
aWZpY2F0aW9uIFJFViAxLjAsIHZpIGxheWVyIHN1cHBvcnRzCj4gPiA+IHRoZQo+ID4gPiBmb2xs
b3dpbmcgcGl4ZWwgZm9ybWF0czogIEFCR1JfODg4OCwgQVJHQl84ODg4LCBCR1JBXzg4ODgsIFJH
QkFfODg4OAo+ID4gCj4gPiBJdCdzIHRydWUgdGhhdCBERTIgVkkgbGF5ZXJzIHN1cHBvcnQgdGhv
c2UgZm9ybWF0cywgYnV0IGl0IHdvdWxkbid0IGNoYW5nZQo+ID4gYW55dGhpbmcgYmVjYXVzZSBh
bHBoYSBibGVuZGluZyBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRob3NlIHBsYW5lcy4gVGhlc2UKPiA+
IGZvcm1hdHMgd2VyZSBkZWxpYmVyYXRlbHkgbGVmdCBvdXQgYmVjYXVzZSB0aGVpciBjb3VudGVy
cGFydHMgd2l0aG91dAo+ID4gYWxwaGEKPiA+IGV4aXN0LCBmb3IgZXhhbXBsZSBBQkdSODg4OCA8
LT4gWEJHUjg4ODguIEl0IHdvdWxkIGFsc28gY29uZnVzZSB1c2VyLAo+ID4gd2hpY2gKPiA+IHdv
dWxkIGV4cGVjdCB0aGF0IGFscGhhIGJsZW5kaW5nIHdvcmtzIGlmIGZvcm1hdCB3aXRoIGFscGhh
IGNoYW5uZWwgaXMKPiA+IHNlbGVjdGVkLgo+ID4gCj4gPiBBZG1pdHRlZGx5IHNvbWUgZm9ybWF0
cyB3aXRoIGFscGhhIGFyZSBzdGlsbCByZXBvcnRlZCBhcyBzdXBwb3J0ZWQgZHVlIHRvCj4gPiBs
YWNrIG9mIHRoZWlyIGNvdW50ZXJwYXJ0cyB3aXRob3V0IGFscGhhLCBidXQgSSdtIGZpbmUgd2l0
aCByZW1vdmluZyB0aGVtCj4gPiBmb3IgY29uc2lzdGVuY3kuCgpJIGNoZWNrZWQgYWdhaW4gYW5k
IGFwcHJvcHJpYXRlIGZvcm1hdHMgKHdpdGggIlgiIGluc3RlYWQgb2YgIkEiKSBhbHJlYWR5IApl
eGlzdC4KCj4gCj4gV2h5IG5vdCB0byByZXBsYWNlICdBJyB3aXRoICdYJyBvbiBhbGwgcmVsZXZh
bnQgZm9ybWF0cyBhbmQgbWFwIHRoZW0KPiB0byBjb3JyZXNwb25kaW5nIGluZGV4IG1hcmtlZCB3
aXRoICdBJyAodGhhdCBiZWhhdmVzIGFzIHRydWUgJ1gnIGZvcgo+IHZpKQoKWWVzLCB0aGF0J3Mg
d291bGQgYmUgYmVzdC4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+IAo+ID4gQmVzdCByZWdhcmRz
LAo+ID4gSmVybmVqCj4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9tYW4gU3RyYXRpaWVua28g
PHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbT4KPiA+ID4gLS0tCj4gPiA+IAo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMgfCA0ICsrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jIGluZGV4Cj4gPiA+IGJkMGU2YTUyZDFkOC4u
MDdjMjdlNmE0Yjc3Cj4gPiA+IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfdmlfbGF5ZXIuYwo+ID4gPiBAQCAtNDA0LDE3ICs0MDQsMjEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fcGxhbmVfZnVuY3MKPiA+ID4gc3VuOGlfdmlfbGF5ZXJfZnVuY3MgPSB7IHN0YXRp
YyBjb25zdCB1MzIgc3VuOGlfdmlfbGF5ZXJfZm9ybWF0c1tdID0gewo+ID4gPiAKPiA+ID4gICAg
ICAgRFJNX0ZPUk1BVF9BQkdSMTU1NSwKPiA+ID4gICAgICAgRFJNX0ZPUk1BVF9BQkdSNDQ0NCwK
PiA+ID4gCj4gPiA+ICsgICAgIERSTV9GT1JNQVRfQUJHUjg4ODgsCj4gPiA+IAo+ID4gPiAgICAg
ICBEUk1fRk9STUFUX0FSR0IxNTU1LAo+ID4gPiAgICAgICBEUk1fRk9STUFUX0FSR0I0NDQ0LAo+
ID4gPiAKPiA+ID4gKyAgICAgRFJNX0ZPUk1BVF9BUkdCODg4OCwKPiA+ID4gCj4gPiA+ICAgICAg
IERSTV9GT1JNQVRfQkdSNTY1LAo+ID4gPiAgICAgICBEUk1fRk9STUFUX0JHUjg4OCwKPiA+ID4g
ICAgICAgRFJNX0ZPUk1BVF9CR1JBNTU1MSwKPiA+ID4gICAgICAgRFJNX0ZPUk1BVF9CR1JBNDQ0
NCwKPiA+ID4gCj4gPiA+ICsgICAgIERSTV9GT1JNQVRfQkdSQTg4ODgsCj4gPiA+IAo+ID4gPiAg
ICAgICBEUk1fRk9STUFUX0JHUlg4ODg4LAo+ID4gPiAgICAgICBEUk1fRk9STUFUX1JHQjU2NSwK
PiA+ID4gICAgICAgRFJNX0ZPUk1BVF9SR0I4ODgsCj4gPiA+ICAgICAgIERSTV9GT1JNQVRfUkdC
QTQ0NDQsCj4gPiA+ICAgICAgIERSTV9GT1JNQVRfUkdCQTU1NTEsCj4gPiA+IAo+ID4gPiArICAg
ICBEUk1fRk9STUFUX1JHQkE4ODg4LAo+ID4gPiAKPiA+ID4gICAgICAgRFJNX0ZPUk1BVF9SR0JY
ODg4OCwKPiA+ID4gICAgICAgRFJNX0ZPUk1BVF9YQkdSODg4OCwKPiA+ID4gICAgICAgRFJNX0ZP
Uk1BVF9YUkdCODg4OCwKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
