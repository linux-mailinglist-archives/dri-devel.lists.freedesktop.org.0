Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D926C9210D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648E898D9;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Sun, 18 Aug 2019 15:37:00 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4BD16E07D;
 Sun, 18 Aug 2019 15:37:00 +0000 (UTC)
Received: from [192.168.0.253] (rev-81-92-251-195.radiolan.sk [81.92.251.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id D8DD47A03D5;
 Sun, 18 Aug 2019 17:29:12 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: nouveau: System crashes with NVIDIA GeForce 8600 GT
Date: Sun, 18 Aug 2019 17:27:03 +0200
User-Agent: KMail/1.9.10
References: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
In-Reply-To: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <201908181727.04076.linux@zary.sk>
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0dXJkYXkgMTcgQXVndXN0IDIwMTkgMTQ6NTA6MzMgQWxleCBEZXdhciB3cm90ZToKPiBI
aSBhbGwsCj4KPiBJJ20gZ2V0dGluZyBmcmVxdWVudCBzeXN0ZW0gY3Jhc2hlcyAoZXZlcnkgZmV3
IGhvdXJzIG9yIHNvKSBhbmQgaXQgc2VlbXMKPiB0aGF0IHRoZSBub3V2ZWF1IGRyaXZlciBpcyBj
YXVzaW5nIHRoZSBpc3N1ZSAoZG1lc2cgb3V0cHV0IGJlbG93KS4gSSBzZWUgaXQKPiB3aXRoIGJv
dGggdjUuMi44IGFuZCB0aGUgdjQuMTkgTFRTIGtlcm5lbC4gU29tZXRpbWVzIHRoZSBzeXN0ZW0K
PiBjb21wbGV0ZWx5IGZyZWV6ZXMgYW5kIHNvbWV0aW1lcyBzZWVtaW5nbHkganVzdCB0aGUgbm91
dmVhdSBkcml2ZXIgZ29lcwo+IGRvd24uIFRoZSBzY3JlZW4gZnJlZXplcyBhbmQgY29sb3VycyBz
dHJlYW0gYWNyb3NzIGl0LiBPZnRlbiBhZnRlciBJCj4gcmVib290IHRoZSBCSU9TIGxvZ28gaXMg
bWFuZ2xlZCB0b28gdW50aWwgdGhlIGZpcnN0IG1vZGVzZXQuIFRoZSBjcmFzaAo+IHNlZW1zIHRv
IGJlIGhhcHBlbmluZyBpbiBudjUwX2ZiX2ludHIoKSBpbiBudjUwLmMuCj4KPiBJJ20gbm90IHN1
cmUgaWYgdGhpcyBpcyByZWxhdGVkLCBidXQgdGhlIHN5c3RlbSBub3cgb2Z0ZW4gZnJlZXplcyBv
bgo+IHN1c3BlbmQgb3IgcmVzdW1lIHNpbmNlIEkgc3dpdGNoZWQgZnJvbSB1c2luZyB0aGUgb2xk
IChyZWNlbnRseQo+IGFiYW5kb25lZCkgcHJvcHJpZXRyeSBOVklESUEgZHJpdmVycywgYWdhaW4g
Ym90aCB3aXRoIDUuMiBhbmQgNC4xOQo+IGtlcm5lbHMuIEJsYWNrbGlzdGluZyB0aGUgbm91dmVh
dSBkcml2ZXIgZG9lc24ndCBzZWVtIHRvIGZpeCBpdCBob3dldmVyLAo+IHRob3VnaCBJIGd1ZXNz
IHRoZSBncmFwaGljcyBjYXJkIGNvdWxkIHN0aWxsIGJlIGNhdXNpbmcgaXNzdWVzIGluIHNvbWUK
PiBvdGhlciB3YXk/IEkgbmV2ZXIgaGFkIHByb2JsZW1zIHdpdGggc3VzcGVuZCBhbmQgcmVzdW1l
IGJlZm9yZS4KPgo+IEFueSBzdWdnZXN0aW9ucyBhYm91dCBob3cgSSBjb3VsZCBkZWJ1ZyB0aGlz
IGZ1cnRoZXI/CgpJcyBpdCByZWFsbHkgYSBzb2Z0d2FyZSBwcm9ibGVtIChkb2VzIGl0IHN0aWxs
IHdvcmsgZmluZSB3aXRoIHByb3ByaWV0YXJ5IApkcml2ZXIpPwpUaGVzZSBuVmlkaWEgY2hpcHMg
YXJlIGtub3duIHRvIGZhaWwgYW5kIGNvcnJ1cHQgQklPUyBsb2dvIHN1Z2dlc3RzIHRoYXQuCgot
LSAKT25kcmVqIFphcnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
