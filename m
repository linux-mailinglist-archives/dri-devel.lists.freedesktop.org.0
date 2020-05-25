Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D51E12E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 18:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ACF89B97;
	Mon, 25 May 2020 16:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5F1989B97;
 Mon, 25 May 2020 16:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 482342A6042;
 Mon, 25 May 2020 18:47:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id BgJVDGJ1vsmT; Mon, 25 May 2020 18:47:17 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C03672A6016;
 Mon, 25 May 2020 18:47:17 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jdGFx-000RY6-B1; Mon, 25 May 2020 18:47:17 +0200
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: uday kiran pichika <udaykiran.pichika@gmail.com>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
 <CAGcx_0Z3JhUP_2KpfC0JQZeugd6VfDSYeErMSZMVVA8sogUt+A@mail.gmail.com>
 <f7b36e27-d7de-80e6-c5a7-1aba198c4036@daenzer.net>
 <CAGcx_0YYxVUXJrVXQHueRi4bw6bePpQGACh2fRmMy_wrt2Y6hQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <c2470eb5-635c-18aa-973a-e36e57f06c98@daenzer.net>
Date: Mon, 25 May 2020 18:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAGcx_0YYxVUXJrVXQHueRi4bw6bePpQGACh2fRmMy_wrt2Y6hQ@mail.gmail.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yNSA2OjM5IHAubS4sIHVkYXkga2lyYW4gcGljaGlrYSB3cm90ZToKPiBUaGFu
a3MgZm9yIHlvdXIgcXVpY2sgY2hlY2sgTWljaGVsLiBJIGhhZCByZW1vdmVkIHRoZSBjb25kaXRp
b24gaW4gbXkgbG9jYWwKPiBzb3VyY2UgaW4gbXNfcHJlc2VudF9jaGVja191bmZsaXAoKSBtZXRo
b2QgYW5kIG1vdmVkIHRoZSBhc3NpZ25tZW50IHRvCj4gbXNfcHJlc2VudF9jaGVja19mbGlwKCkg
bWV0aG9kLiBCZWxvdyBpcyB0aGUgc25pcHBldC4KPiAKPiBzdGF0aWMgQm9vbCBtc19wcmVzZW50
X2NoZWNrX2ZsaXAoUlJDcnRjUHRyIGNydGMsCj4gICAgICAgICAgICAgICAgICAgICAgIFdpbmRv
d1B0ciB3aW5kb3csCj4gICAgICAgICAgICAgICAgICAgICAgIFBpeG1hcFB0ciBwaXhtYXAsCj4g
ICAgICAgICAgICAgICAgICAgICAgIEJvb2wgc3luY19mbGlwLAo+ICAgICAgICAgICAgICAgICAg
ICAgICBQcmVzZW50RmxpcFJlYXNvbiAqcmVhc29uKQo+IHsKPiAgICAgaWYgKG1zLT5kcm1tb2Rl
LnNwcml0ZXNfdmlzaWJsZSA+IDApCj4gICAgICAgICByZXR1cm4gRkFMU0U7Cj4gCj4gICAgIEJv
b2wgcmV0ID0gbXNfcHJlc2VudF9jaGVja191bmZsaXAoY3J0Yywgd2luZG93LCBwaXhtYXAsIHN5
bmNfZmxpcCwKPiByZWFzb24pOwo+ICAgICBtcy0+ZmxpcF93aW5kb3cgPSB3aW5kb3c7Cj4gICAg
IHJldHVybiByZXQ7Cj4gfQoKVGhhdCdzIGFsc28gYnJva2VuLCBpbiBhIGRpZmZlcmVudCB3YXk6
IG1zLT5mbGlwX3dpbmRvdyBtdXN0IG9ubHkgYmUKdXBkYXRlZCBpZiBtc19wcmVzZW50X2NoZWNr
X3VuZmxpcCByZXR1cm5lZCBUUlVFLiAobXNfcHJlc2VudF9jaGVja19mbGlwCm1heSBiZSBjYWxs
ZWQgZm9yIG90aGVyIHdpbmRvd3Mgd2hpY2ggY2Fubm90IHVzZSBwYWdlIGZsaXBwaW5nLCBpbiB3
aGljaApjYXNlIGl0IHJldHVybnMgRkFMU0UpCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnpl
ciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUg
c29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFgg
ZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
