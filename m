Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73FFEC74
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 14:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407889B57;
	Sat, 16 Nov 2019 13:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D2D89B57
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 13:37:29 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57671
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iVyGV-000494-9t; Sat, 16 Nov 2019 14:37:27 +0100
Subject: Re: drm core/helpers and MIT license
To: Emmanuel Vadot <manu@bidouilliste.com>
References: <20191114200132.GA11077@SDF.ORG> <20191115123432.GB1208@intel.com>
 <f6629560-6b95-c125-a1d5-51554b2a1dab@tronnes.org>
 <20191116125715.0e83ce339c421465fa00266e@bidouilliste.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <109e1811-fe2c-dad5-ab0d-716d033ee92c@tronnes.org>
Date: Sat, 16 Nov 2019 14:37:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191116125715.0e83ce339c421465fa00266e@bidouilliste.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ycSiOsZmnKomxEv3p1Qlx9Bl0MyrqagBragq+mEfInI=; b=pSTzM+ezSeGv97+4yeQltmZa+S
 w8QT2CPt3Dum9ihaoGYQceUJVZmUKjkOAJ6/k0t4USGirU5+LJjTgwaWlY6Tq17rFx98lt6+NA202
 DbHRadV6TrSDE2salE9IjP2BucMLYKJp61AGS5bgH6BBg5GLt7WXV557vKfqewp4qIKPLNadkgFzj
 Yxr2hB4lprS0g4zIWn1AObiCrhZZrJJyGRxRaOFbbmqN7nfB3/sii/9goxgnR/dgqw0PKUklmXokQ
 U6N7isNNlqecwEBeREHNfBFlKwnyN9IH64VhAIvtsVs0OZfDKmqotHEgSsuzc9rhFfK52fXk6J5y9
 CJvY90Uw==;
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
Cc: daniel.vetter@ffwll.ch, coypu@sdf.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTYuMTEuMjAxOSAxMi41Nywgc2tyZXYgRW1tYW51ZWwgVmFkb3Q6Cj4gT24gRnJpLCAx
NSBOb3YgMjAxOSAxNTozMzo0NiArMDEwMAo+IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25u
ZXMub3JnPiB3cm90ZToKPiAKPj4KPj4KPj4gRGVuIDE1LjExLjIwMTkgMTMuMzQsIHNrcmV2IFZp
bGxlIFN5cmrDpGzDpDoKPj4+IE9uIFRodSwgTm92IDE0LCAyMDE5IGF0IDA4OjAxOjMyUE0gKzAw
MDAsIGNveXB1QHNkZi5vcmcgd3JvdGU6Cj4+Pj4gSGkgRGFuaWVsLAo+Pj4+Cj4+Pj4gSSBkb24n
dCB0aGluayB3ZSBjYW4gbWFrZSBhbnkgY29tcGxhaW50cyBhYm91dCBHUEwgYmVpbmcgbW9yZSB3
aWRlbHkKPj4+PiB1c2VkIGluIHRoZSBEUk0gY29kZS4gSXQncyBuaWNlIHRvIGhhdmUgdGhlIGNv
ZGUgYXQgYWxsLCB0aGUgTUlUIGxpY2Vuc2UKPj4+PiBpcyBhIGJvbnVzLiBUaGFua3MgZm9yIHdy
aXRpbmcgaXQgYW5kIGJlYXJpbmcgd2l0aCB1cy4KPj4+Pgo+Pj4+IFdvdWxkIHJld3JpdGVzIGRv
bmUgcHVyZWx5IGZvciBsaWNlbnNpbmcgcmVhc29ucyBiZSBhY2NlcHRlZCB1cHN0cmVhbT8KPj4+
Cj4+PiBSZXdyaXRlIHNob3VsZCBiZSB0aGUgbGFzdCByZXNvcnQuIEkgdGhpbmsgYSBsb3Qgb2Yg
dGhlIEdQTCBvbmx5IHN0dWZmCj4+PiBpcyBxdWl0ZSByZWNlbnQgc28gdGhlcmUncyBhIGdvb2Qg
Y2hhbmNlIHRoZSBhdXRob3IocykgYXJlIHN0aWxsIGFyb3VuZAo+Pj4gdG8gZGlzY3VzcyByZWxp
Y2Vuc2luZy4KPj4+Cj4+Cj4+IElmIHNvbWVvbmUgc2VuZHMgcGF0Y2hlcyB0byBNSVQgbGljZW5z
ZSB0aGUgd29yayBJJ3ZlIGRvbmUsIEknbGwgYmUKPj4gaGFwcHkgdG8gYWNrIGl0LiBJdCdzIG9u
bHkgcmVjZW50bHkgdGhhdCBJJ3ZlIGJlZW4gYXdhcmUgb2YgdGhlIGZhY3QKPj4gdGhhdCBNSVQg
bGljZW5zZWQgd2FzIGEgdGhpbmcgaW4gdGhlIGtlcm5lbC4gSSB3YXMgdW5kZXIgdGhlIGltcHJl
c3Npb24KPj4gdGhhdCBhbGwgbmV3IGNvZGUgc2hvdWxkIGJlIEdQTCBhbmQgTUlUIHdlcmUgZm9y
IGNvZGUgaW1wb3J0ZWQgZnJvbQo+PiBlbHNld2hlcmUuIEkgd291bGQgbG92ZSB0byBzZWUgbXkg
d29yayBiZWluZyB1c2VkIG9uIHRoZSBCU0Qncy4KPiAKPiAgQW5kIEkgd291bGQgbG92ZSB0byBi
ZSBhYmxlIHRvIHVzZSB5b3VyIHdvcmsgb24gRnJlZUJTRCA6KQo+ICBJIGRvbid0IHJlYWxseSBr
bm93IHRoZSBydWxlcyBidXQgc2hvdWxkbid0IHlvdSBzZW5kIGEgcGF0Y2ggdG8KPiByZWxpY2Vu
Y2UgPwoKSSBkb24ndCBrbm93IHRoZSBydWxlcyBlaXRoZXIsIGJ1dCBJIGRvbid0IHRoaW5rIEkg
aGF2ZSB0byBiZSB0aGUgYXV0aG9yCm9mIHRoZSByZWxpY2Vuc2luZyBwYXRjaCwgSSBqdXN0IGhh
dmUgdG8gcHV0IG15IHN0YW1wIG9uIGl0LgpNeXNlbGYgSSBoYXZlbid0IGdvdCB0aGUgdGltZSB0
byBkbyB0aGUgd29yaywgaXQncyBub3QganVzdCBwdXR0aW5nIG91dAphIHBhdGNoLCBldmVyeW9u
ZSBoYXZpbmcgbWFkZSBjaGFuZ2VzIHRvIHRoZSBhZmZlY3RlZCBmaWxlcyB3b3VsZCBhbHNvCmhh
dmUgdG8gYmUgb2sgd2l0aCB0aGUgbmV3IGxpY2Vuc2UuCgpOb3JhbGYuCgo+ICBSaWdodCBub3cg
Zm9yIG1lIGRybV9jbGllbnQgKGFuZCBvdGhlcnMpIGJlaW5nIEdQTCBpcyBhIHByb2JsZW0gZm9y
IG15Cj4gdXBkYXRlIG9mIERSTSBpbiBGcmVlQlNEIHNvIEknbSBub3QgdXNpbmcgaXQgKHdoaWNo
IGlzIGJhZCBhbmQgd2lsbAo+IHByb2JhYmx5IGNhdXNlIHByb2JsZW1zKS4KPiAKPj4gTm9yYWxm
Lgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
