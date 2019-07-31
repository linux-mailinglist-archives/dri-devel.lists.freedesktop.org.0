Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F617EEB3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E95C6ECF2;
	Fri,  2 Aug 2019 08:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Wed, 31 Jul 2019 08:17:13 UTC
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075DA899D4;
 Wed, 31 Jul 2019 08:17:12 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDYrzyYxhqeg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id m0a13fv6V8Ap2Ai
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 31 Jul 2019 10:10:51 +0200 (CEST)
Date: Wed, 31 Jul 2019 10:10:43 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: shake fist angrily at dma-mapping
Message-ID: <20190731081043.GA55937@gerhold.net>
References: <20190730214633.17820-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730214633.17820-1-robdclark@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1564561031; 
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Ldg0vkUExaoCJzEDplQufh0vP3aB8jIVw5TBoixU8Ng=;
 b=cPFeh3ubhekE6YnATp0htLjy3G1yl7zz18aOAT2Y+gmPnD8rAAk1WrPODiw+gwQZtI
 NlyawBHhw9KaN9Tyyc0Y5NBMyQZomAFP3UdUmxpDS6t2nV66C9BZJberQ/X4pF860cfH
 Fks4D4yaDRQnPRR/q3gxGcNDDtvPB0IglQAopcT/SVDJyH9M0KeZpvsacJmNajbMQTk8
 vHf+9Hno83Di6tCynEGwc8+WIMfMKAneE0aOD1FV60vU0aoFayBgElV0i2bLQZV/5hYb
 4Xaacc7HbY5jm+P4ZIwOHOMtOe8CHqPKRQMRCtDku2ZnsJngES5p4mOLhRkQyojHtnED
 fsHg==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDI6NDY6MjhQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBTbywgdXNp
bmcgZG1hX3N5bmNfKiBmb3Igb3VyIGNhY2hlIG5lZWRzIHdvcmtzIG91dCB3LyBkbWEgaW9tbXUg
b3BzLCBidXQKPiBpdCBmYWxscyBhcHBhcnQgd2l0aCBkbWEgZGlyZWN0IG9wcy4gIFRoZSBwcm9i
bGVtIGlzIHRoYXQsIGRlcGVuZGluZyBvbgo+IGRpc3BsYXkgZ2VuZXJhdGlvbiwgd2UgY2FuIGhh
dmUgZWl0aGVyIHNldCBvZiBkbWEgb3BzIChtZHA0IGFuZCBkcHUgaGF2ZQo+IGlvbW11IHdpcmVk
IHRvIG1kc3Mgbm9kZSwgd2hpY2ggbWFwcyB0byB0b3BsZXZlbCBkcm0gZGV2aWNlLCBidXQgbWRw
NQo+IGhhcyBpb21tdSB3aXJlZCB1cCB0byB0aGUgbWRwIHN1Yi1ub2RlIHdpdGhpbiBtZHNzKS4K
PiAKPiBGaXhlcyB0aGlzIHNwbGF0IG9uIG1kcDUgZGV2aWNlczoKPiAKPiAgICBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZmZmZmY4
MDAwMDAwMAo+ICAgIE1lbSBhYm9ydCBpbmZvOgo+ICAgICAgRVNSID0gMHg5NjAwMDE0NAo+ICAg
ICAgRXhjZXB0aW9uIGNsYXNzID0gREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cwo+ICAg
ICAgU0VUID0gMCwgRm5WID0gMAo+ICAgICAgRUEgPSAwLCBTMVBUVyA9IDAKPiAgICBEYXRhIGFi
b3J0IGluZm86Cj4gICAgICBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMTQ0Cj4gICAgICBDTSA9IDEs
IFduUiA9IDEKPiAgICBzd2FwcGVyIHBndGFibGU6IDRrIHBhZ2VzLCA0OC1iaXQgVkFzLCBwZ2Rw
PTAwMDAwMDAwODEwZTQwMDAKPiAgICBbZmZmZmZmZmY4MDAwMDAwMF0gcGdkPTAwMDAwMDAwMDAw
MDAwMDAKPiAgICBJbnRlcm5hbCBlcnJvcjogT29wczogOTYwMDAxNDQgWyMxXSBTTVAKPiAgICBN
b2R1bGVzIGxpbmtlZCBpbjogYnRxY29tc21kIGJ0cWNhIGJsdWV0b290aCBjZmc4MDIxMSBlY2Ro
X2dlbmVyaWMgZWNjIHJma2lsbCBsaWJhcmM0IHBhbmVsX3NpbXBsZSBtc20gd2Nuc3NfY3RybCBx
cnRyX3NtZCBkcm1fa21zX2hlbHBlciB2ZW51c19lbmMgdmVudXNfZGVjIHZpZGVvYnVmMl9kbWFf
c2cgdmlkZW9idWYyX21lbW9wcyBkcm0gdmVudXNfY29yZSBpcHY2IHFydHIgcWNvbV93Y25zc19w
aWwgdjRsMl9tZW0ybWVtIHFjb21fc3lzbW9uIHZpZGVvYnVmMl92NGwyIHFtaV9oZWxwZXJzIHZp
ZGVvYnVmMl9jb21tb24gY3JjdDEwZGlmX2NlIG1kdF9sb2FkZXIgcWNvbV9jb21tb24gdmlkZW9k
ZXYgcWNvbV9nbGlua19zbWVtIHJlbW90ZXByb2MgYm1jMTUwX2FjY2VsX2kyYyBibWMxNTBfbWFn
bl9pMmMgYm1jMTUwX2FjY2VsX2NvcmUgYm1jMTUwX21hZ24gc25kX3NvY19scGFzc19hcHE4MDE2
IHNuZF9zb2NfbXNtODkxNl9hbmFsb2cgbW1zMTE0IG1jIG5mX2RlZnJhZ19pcHY2IHNuZF9zb2Nf
bHBhc3NfY3B1IHNuZF9zb2NfYXBxODAxNl9zYmMgaW5kdXN0cmlhbGlvX3RyaWdnZXJlZF9idWZm
ZXIga2ZpZm9fYnVmIHNuZF9zb2NfbHBhc3NfcGxhdGZvcm0gc25kX3NvY19tc204OTE2X2RpZ2l0
YWwgZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcwo+ICAgIENQVTogMiBQSUQ6IDMzIENvbW06
IGt3b3JrZXIvMjoxIE5vdCB0YWludGVkIDUuMy4wLXJjMiAjMQo+ICAgIEhhcmR3YXJlIG5hbWU6
IFNhbXN1bmcgR2FsYXh5IEE1VSAoRVVSKSAoRFQpCj4gICAgV29ya3F1ZXVlOiBldmVudHMgZGVm
ZXJyZWRfcHJvYmVfd29ya19mdW5jCj4gICAgcHN0YXRlOiA4MDAwMDAwNSAoTnpjdiBkYWlmIC1Q
QU4gLVVBTykKPiAgICBwYyA6IF9fY2xlYW5fZGNhY2hlX2FyZWFfcG9jKzB4MjAvMHgzOAo+ICAg
IGxyIDogYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKzB4MjgvMHgzMAo+ICAgIHNwIDogZmZmZjAw
MDAxMTU3MzZhMAo+ICAgIHgyOTogZmZmZjAwMDAxMTU3MzZhMCB4Mjg6IDAwMDAwMDAwMDAwMDAw
MDEKPiAgICB4Mjc6IGZmZmY4MDAwNzQ4MzA4MDAgeDI2OiBmZmZmMDAwMDExNDc4MDAwCj4gICAg
eDI1OiAwMDAwMDAwMDAwMDAwMDAwIHgyNDogMDAwMDAwMDAwMDAwMDAwMQo+ICAgIHgyMzogZmZm
ZjAwMDAxMTQ3OGE5OCB4MjI6IGZmZmY4MDAwMDlmZDFjMTAKPiAgICB4MjE6IDAwMDAwMDAwMDAw
MDAwMDEgeDIwOiBmZmZmODAwMDc1YWQwYTAwCj4gICAgeDE5OiAwMDAwMDAwMDAwMDAwMDAwIHgx
ODogZmZmZjAwMDAxMTJiMjAwMAo+ICAgIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAw
MDAwMDAwMDAwMDAKPiAgICB4MTU6IDAwMDAwMDAwZmZmZmZmZjAgeDE0OiBmZmZmMDAwMDExNDU1
ZDcwCj4gICAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAwMDAwMDAyOAo+ICAg
IHgxMTogMDAwMDAwMDAwMDAwMDAwMSB4MTA6IGZmZmYwMDAwMTEwNmMwMDAKPiAgICB4OSA6IGZm
ZmY3ZTAwMDFkNmIzODAgeDggOiAwMDAwMDAwMDAwMDAxMDAwCj4gICAgeDcgOiBmZmZmN2UwMDAx
ZDZiMzgwIHg2IDogZmZmZjdlMDAwMWQ2YjM4Mgo+ICAgIHg1IDogMDAwMDAwMDAwMDAwMDAwMCB4
NCA6IDAwMDAwMDAwMDAwMDEwMDAKPiAgICB4MyA6IDAwMDAwMDAwMDAwMDAwM2YgeDIgOiAwMDAw
MDAwMDAwMDAwMDQwCj4gICAgeDEgOiBmZmZmZmZmZjgwMDAxMDAwIHgwIDogZmZmZmZmZmY4MDAw
MDAwMAo+ICAgIENhbGwgdHJhY2U6Cj4gICAgIF9fY2xlYW5fZGNhY2hlX2FyZWFfcG9jKzB4MjAv
MHgzOAo+ICAgICBkbWFfZGlyZWN0X3N5bmNfc2dfZm9yX2RldmljZSsweGI4LzB4ZTgKPiAgICAg
Z2V0X3BhZ2VzKzB4MjJjLzB4MjUwIFttc21dCj4gICAgIG1zbV9nZW1fZ2V0X2FuZF9waW5faW92
YSsweGRjLzB4MTY4IFttc21dCj4gICAgIC4uLgo+IAo+IEZpeGVzIHRoZSBjb21iaW5hdGlvbiBv
ZiB0d28gcGF0Y2hlczoKPiAKPiBGaXhlczogMDAzNmJjNzNjY2JlICgiZHJtL21zbTogc3RvcCBh
YnVzaW5nIGRtYV9tYXAvdW5tYXAgZm9yIGNhY2hlIikKPiBGaXhlczogNDQ5ZmE1NGQ2ODE1ICgi
ZG1hLWRpcmVjdDogY29ycmVjdCB0aGUgcGh5c2ljYWwgYWRkciBpbiBkbWFfZGlyZWN0X3N5bmNf
c2dfZm9yX2NwdS9kZXZpY2UiKQoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghIEl0IGZpeGVzIHRoZSBp
c3N1ZSBvbiBNU004OTE2L0E1VToKClRlc3RlZC1ieTogU3RlcGhhbiBHZXJob2xkIDxzdGVwaGFu
QGdlcmhvbGQubmV0PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
