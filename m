Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5965EBB7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB7310E714;
	Thu,  5 Jan 2023 13:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1510E714
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:01:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2D0A22C0D;
 Thu,  5 Jan 2023 13:01:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B0A6138DF;
 Thu,  5 Jan 2023 13:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CjDWJD7KtmOEXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 13:01:50 +0000
Message-ID: <d5d44da7-2ca9-d26d-7474-223abb8f6aa3@suse.de>
Date: Thu, 5 Jan 2023 14:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Borislav Petkov <bp@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Danilo Krummrich <dakr@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
 <20221208124207.GA7628@chq-T47> <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------788T3eX9uGKbgsAhXWxKYVlB"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.10
X-Spamd-Result: default: False [-2.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[10];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,linux.intel.com,kernel.org,gmail.com,suse.de,infradead.org,redhat.com,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------788T3eX9uGKbgsAhXWxKYVlB
Content-Type: multipart/mixed; boundary="------------hvO40fwdB0qR1UubastegmCo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Cai Huoqing <cai.huoqing@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Borislav Petkov <bp@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Danilo Krummrich <dakr@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <d5d44da7-2ca9-d26d-7474-223abb8f6aa3@suse.de>
Subject: Re: [RESEND PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
 <20221208124207.GA7628@chq-T47> <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>
In-Reply-To: <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>

--------------hvO40fwdB0qR1UubastegmCo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjMgdW0gMTM6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIERlYyAwOCwgMjAyMiBhdCAwODo0MjowN1BNICswODAwLCBDYWkgSHVvcWluZyB3
cm90ZToNCj4+IE9uIDAzIDEy5pyIIDIyIDE4OjIyOjUxLCBDYWkgSHVvcWluZyB3cm90ZToN
Cj4+PiBDb21taXQgMzk5NTE2YWIwZmVlICgiTUFJTlRBSU5FUlM6IEFkZCBhIGJ1bmNoIG9m
IGxlZ2FjeSAoVU1TKSBEUk0gZHJpdmVycyIpDQo+Pj4gbWFya2VkIHRoZXNlIGRyaXZlcnMg
b2Jzb2xldGUgNyB5ZWFycyBhZ28uDQo+Pj4gQW5kIHRoZSBtZXNhIFVNRCBvZiB0aGVzZSBk
cm0gZHJpdmVycyBhbHJlYWR5IGluIGRlcHJlY2F0ZWQgbGlzdA0KPj4+IGluIHRoZSBsaW5r
OiBodHRwczovL2RvY3MubWVzYTNkLm9yZy9zeXN0ZW1zLmh0bWwNCj4+Pg0KPj4+IDNkZngg
R2xpZGUtLT5kcml2ZXIvZ3B1L2RybS90ZGZ4DQo+Pj4gTWF0cm94LS0+ZHJpdmVyL2dwdS9k
cm0vbWdhDQo+Pj4gSW50ZWwgaTgxMC0tPmRyaXZlci9ncHUvZHJtL2k4MTANCj4+PiBTMyBT
YXZhZ2UtLT5kcml2ZXJzL2dwdS9kcm0vc2F2YWdlDQo+Pj4gQVRJIFJhZ2UgMTI4LT5kcml2
ZXJzL2dwdS9kcm0vcjEyOA0KPj4+IFNpbGljb24gSW50ZWdyYXRlZCBTeXN0ZW1zLT5kcml2
ZXJzL2dwdS9kcm0vc2lzDQo+Pj4gVklBIFVuaWNocm9tZS0+ZHJpdmVycy9ncHUvZHJtL3Zp
YQ0KPj4+DQo+Pj4gdjEtPnYyOg0KPj4+IDEuQWRkIGRybSB2aWEgZHJpdmVyIHRvIHRoZSBw
YXRjaHNldC4NCj4+PiAyLlJlbW92ZSByZWxhdGVkIGRybV9wY2lpZHMuDQo+Pj4gMy5SZW1v
dmUgcmVsYXRlZCBkcm0gdWFwaSBoZWFkZXIgZmlsZXMuDQo+Pj4gNC5zcGxpdCB0byBzZXJp
ZXMgYXZvaWQgbGFyZ2UgcGF0Y2ggZW1haWwuDQo+PiBKdXN0IHBpbmcgdGhlc2UgcGF0Y2gg
c2VyaWVzLg0KPj4gVGhlIHYxIGNvbW1lbnRzIGhlcmUsDQo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzM5ZDhhYzFhLWQ5MmYtN2NkYy0xNGNkLTk0NDM0MmY3OGMxYUBzdXNl
LmRlLw0KPiANCj4gQXJlIHdlIHJlYWxseSBzdXJlIHRoYXQgYWxsIHVzZXJzIG9mIHRoZXNl
IGFyZSBnb25lPyBBbHNvLCBJJ20gbm90IHJlYWxseQ0KPiBzZWVpbmcgdGhlIGJlbmVmaXQg
b2YgdGhpcywgd2UndmUgbWFuYWdlZCB0byBzcGxpdCBvdXQgdGhlIGxlZ2FjeSBjb2RlDQo+
IHF1aXRlIHdlbGwsIHNvIGNhcnJ5aW5nIGFyb3VuZCBpc24ndCBodXJ0aW5nIGFueXRoaW5n
IGFmYWljcz8NCg0KTXkgZmlyc3QgcmVhY3Rpb24gd2FzICdubyB3YXknLiBCdXQgdGhlbiBJ
IHRob3VnaHQgYWJvdXQgcG9zc2libGUgdXNlcnMgDQpvZiB0aGlzIGNvZGUgYW5kIEkgY2Fu
bm90IHNlZSBhbnlvbmUgcmVseWluZyBvbiBpdC4gWW91J2QgbmVlZCBhbiANCmFuY2llbnQg
dXNlcnNwYWNlIE1lc2EgbGlicmFyeSBwbHVzIHRoZSBtb3N0IHJlY2VudCBrZXJuZWwuIEFu
ZCBhbGwgdGhlIA0KcmVuZGVyaW5nIGlzIE9wZW5HTCAxLnguIEFyZSB0aGVyZSBldmVuIExp
bnV4IHByb2dyYW1zIGZvciB0aGF0Pw0KDQpTbyBhcyBmYXIgYXMgSSdtIGNvbmNlcm5lZA0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
CkRSTSdzIGxlZ2FjeSBpbmZyYXN0cnVjdHVyZSBjb3VsZCBiZSBrZXB0IGZvciBhIGZldyBt
b3JlIHJlbGVhc2VzLiBKdXN0IA0KaW4gY2FzZSBvbmUgb2YgdGhlIGRyaXZlcnMgbWFrZXMg
YSBjb21lYmFjay4NCg0KVGhlcmUgaXMgY29kZSBpbiBub3V2ZWF1IHRoYXQgdXNlcyBsZWdh
Y3kgZnVuY3Rpb25hbGl0eSBmb3IgaXRzIGFuY2llbnQgDQp1c2Vyc3BhY2UuIEkgdGhpbmsg
d2Ugc2hvdWxkIHNjcmFwIHRoYXQgYXMgd2VsbC4gKFNlZSANCk5PVVZFQVVfTEVHQUNZX0NU
WF9TVVBQT1JULikNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtRGFuaWVsDQo+IA0K
Pj4NCj4+IFRoYW5rcywNCj4+IENhaQ0KPj4+DQo+Pj4gQ2FpIEh1b3FpbmcgKDEwKToNCj4+
PiAgICBkcm06IFJlbW92ZSB0aGUgb2Jzb2xldGUgZHJpdmVyLWk4MTANCj4+PiAgICBkcm06
IFJlbW92ZSB0aGUgb2Jzb2xldGUgZHJpdmVyLW1nYQ0KPj4+ICAgIGRybTogUmVtb3ZlIHRo
ZSBvYnNvbGV0ZSBkcml2ZXItcjEyOA0KPj4+ICAgIGRybTogUmVtb3ZlIHRoZSBvYnNvbGV0
ZSBkcml2ZXItc2F2YWdlDQo+Pj4gICAgZHJtOiBSZW1vdmUgdGhlIG9ic29sZXRlIGRyaXZl
ci1zaXMNCj4+PiAgICBkcm06IFJlbW92ZSB0aGUgb2Jzb2xldGUgZHJpdmVyLXRkZngNCj4+
PiAgICBkcm06IFJlbW92ZSB0aGUgb2Jzb2xldGUgZHJpdmVyLXZpYQ0KPj4+ICAgIGRybTog
QWRkIGNvbW1lbnRzIHRvIEtjb25maWcNCj4+PiAgICBkcm06IFJlbW92ZSBzb21lIG9ic29s
ZXRlIGRybSBwY2lpZHModGRmeCwgbWdhLCBpODEwLCBzYXZhZ2UsIHIxMjgsDQo+Pj4gICAg
ICBzaXMsIHZpYSkNCj4+PiAgICBNQUlOVEFJTkVSUzogUmVtb3ZlIHNvbWUgb2Jzb2xldGUg
ZHJpdmVycyBpbmZvKHRkZngsIG1nYSwgaTgxMCwNCj4+PiAgICAgIHNhdmFnZSwgcjEyOCwg
c2lzKQ0KPj4+DQo+Pj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAyOSAtDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAg
IHwgICA1OSArLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAg
ICB8ICAgIDcgLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL2k4MTAvTWFrZWZpbGUgICAgICAg
ICB8ICAgIDggLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYyAgICAg
ICB8IDEyNjYgLS0tLS0tLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Ry
di5jICAgICAgIHwgIDEwMSAtDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Ry
di5oICAgICAgIHwgIDI0NiAtLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL21nYS9NYWtlZmls
ZSAgICAgICAgICB8ICAgMTEgLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZG1h
LmMgICAgICAgICB8IDExNjggLS0tLS0tLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2Ev
bWdhX2Rydi5jICAgICAgICAgfCAgMTA0IC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2Ev
bWdhX2Rydi5oICAgICAgICAgfCAgNjg1IC0tLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0v
bWdhL21nYV9pb2MzMi5jICAgICAgIHwgIDE5NyAtLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJt
L21nYS9tZ2FfaXJxLmMgICAgICAgICB8ICAxNjkgLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9tZ2EvbWdhX3N0YXRlLmMgICAgICAgfCAxMDk5IC0tLS0tLS0tDQo+Pj4gICBkcml2ZXJz
L2dwdS9kcm0vbWdhL21nYV93YXJwLmMgICAgICAgIHwgIDE2NyAtLQ0KPj4+ICAgZHJpdmVy
cy9ncHUvZHJtL3IxMjgvTWFrZWZpbGUgICAgICAgICB8ICAgMTAgLQ0KPj4+ICAgZHJpdmVy
cy9ncHUvZHJtL3IxMjgvYXRpX3BjaWdhcnQuYyAgICB8ICAyMjggLS0NCj4+PiAgIGRyaXZl
cnMvZ3B1L2RybS9yMTI4L2F0aV9wY2lnYXJ0LmggICAgfCAgIDMxIC0NCj4+PiAgIGRyaXZl
cnMvZ3B1L2RybS9yMTI4L3IxMjhfY2NlLmMgICAgICAgfCAgOTQ0IC0tLS0tLS0NCj4+PiAg
IGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmMgICAgICAgfCAgMTE2IC0NCj4+PiAg
IGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmggICAgICAgfCAgNTQ0IC0tLS0NCj4+
PiAgIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYyAgICAgfCAgMTk5IC0tDQo+
Pj4gICBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lycS5jICAgICAgIHwgIDExOCAtDQo+
Pj4gICBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X3N0YXRlLmMgICAgIHwgMTY0MSAtLS0t
LS0tLS0tLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9NYWtlZmlsZSAgICAgICB8
ICAgIDkgLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfYmNpLmMgICB8
IDEwODIgLS0tLS0tLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2Ry
di5jICAgfCAgIDkxIC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2Ry
di5oICAgfCAgNTgwIC0tLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdl
X3N0YXRlLmMgfCAxMTY5IC0tLS0tLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vc2lzL01h
a2VmaWxlICAgICAgICAgIHwgICAxMCAtDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vc2lzL3Np
c19kcnYuYyAgICAgICAgIHwgIDE0MyAtDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vc2lzL3Np
c19kcnYuaCAgICAgICAgIHwgICA4MCAtDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vc2lzL3Np
c19tbS5jICAgICAgICAgIHwgIDM2MyAtLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZGZ4
L01ha2VmaWxlICAgICAgICAgfCAgICA4IC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZGZ4
L3RkZnhfZHJ2LmMgICAgICAgfCAgIDkwIC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZGZ4
L3RkZnhfZHJ2LmggICAgICAgfCAgIDQ3IC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS92aWEv
TWFrZWZpbGUgICAgICAgICAgfCAgICA4IC0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS92aWEv
dmlhXzNkX3JlZy5oICAgICAgfCAxNzcxIC0tLS0tLS0tLS0tLQ0KPj4+ICAgZHJpdmVycy9n
cHUvZHJtL3ZpYS92aWFfZHJpMS5jICAgICAgICB8IDM2MzAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPj4+ICAgaW5jbHVkZS9kcm0vZHJtX3BjaWlkcy5oICAgICAgICAgICAgICB8
ICAxMTIgLQ0KPj4+ICAgaW5jbHVkZS91YXBpL2RybS9pODEwX2RybS5oICAgICAgICAgICB8
ICAyOTIgLS0NCj4+PiAgIGluY2x1ZGUvdWFwaS9kcm0vbWdhX2RybS5oICAgICAgICAgICAg
fCAgNDI5IC0tLQ0KPj4+ICAgaW5jbHVkZS91YXBpL2RybS9yMTI4X2RybS5oICAgICAgICAg
ICB8ICAzMzYgLS0tDQo+Pj4gICBpbmNsdWRlL3VhcGkvZHJtL3NhdmFnZV9kcm0uaCAgICAg
ICAgIHwgIDIyMCAtLQ0KPj4+ICAgaW5jbHVkZS91YXBpL2RybS9zaXNfZHJtLmggICAgICAg
ICAgICB8ICAgNzcgLQ0KPj4+ICAgaW5jbHVkZS91YXBpL2RybS92aWFfZHJtLmggICAgICAg
ICAgICB8ICAyODIgLS0NCj4+PiAgIDQ2IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxOTk3NSBkZWxldGlvbnMoLSkNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vaTgxMC9NYWtlZmlsZQ0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jDQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kcnYuaA0KPj4+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2EvTWFrZWZpbGUNCj4+PiAgIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kbWEuYw0KPj4+ICAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5jDQo+Pj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZHJ2LmgNCj4+PiAgIGRlbGV0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pb2MzMi5jDQo+Pj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaXJxLmMNCj4+PiAg
IGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jDQo+
Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffd2FycC5j
DQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3IxMjgvTWFrZWZp
bGUNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcjEyOC9hdGlf
cGNpZ2FydC5jDQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Ix
MjgvYXRpX3BjaWdhcnQuaA0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9yMTI4L3IxMjhfY2NlLmMNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jDQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuaA0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYw0KPj4+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaXJxLmMNCj4+PiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X3N0YXRlLmMNCj4+PiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vc2F2YWdlL01ha2VmaWxlDQo+Pj4g
ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfYmNp
LmMNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vc2F2YWdlL3Nh
dmFnZV9kcnYuYw0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9z
YXZhZ2Uvc2F2YWdlX2Rydi5oDQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3NhdmFnZS9zYXZhZ2Vfc3RhdGUuYw0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9zaXMvTWFrZWZpbGUNCj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19kcnYuYw0KPj4+ICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5oDQo+Pj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0uYw0KPj4+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90ZGZ4L01ha2VmaWxlDQo+Pj4gICBkZWxldGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3RkZngvdGRmeF9kcnYuYw0KPj4+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90ZGZ4L3RkZnhfZHJ2LmgNCj4+PiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmlhL01ha2VmaWxlDQo+Pj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfM2RfcmVnLmgNCj4+
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcmkxLmMN
Cj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvZHJtL2k4MTBfZHJtLmgN
Cj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvZHJtL21nYV9kcm0uaA0K
Pj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vcjEyOF9kcm0uaA0K
Pj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vc2F2YWdlX2RybS5o
DQo+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2RybS9zaXNfZHJtLmgN
Cj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaA0K
Pj4+DQo+Pj4gLS0gDQo+Pj4gMi4yNS4xDQo+Pj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------hvO40fwdB0qR1UubastegmCo--

--------------788T3eX9uGKbgsAhXWxKYVlB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO2yj4FAwAAAAAACgkQlh/E3EQov+B8
JxAAueaQ1fZWgyNoCRZd0zVkm/NaPA3GojXcVhrvYLLxZP7tYsRYufO1v81/U3BkHqP4FRbGbrFg
JaWcoS0GgFCMv16oNQ1ZenJZsA4Mf4QzXuFCZ0hnDo6Rvz5JGajPxVGieF/DGMpLo/NMLUHd6JAP
w1tXwuSccqOEkRcqVcH1rqN2Qplu6wuu//fJVxbxmaL45T2LTd/6oiDJ47CXFkk44I/5CFI94J0X
Yy+zPX1WLE/wHTq+b5nWI2GuhbCMn537YFM+W80iYae0nMLV3kUHjCrnnYwRc6DmbG/aoCD42RqG
RxTMZqdM54jNL7xjhC9VhF8Boo7MndBGwaLScR+2NRULD9G2ZgY5YDT7ARzKwm/uircW29DvGgHm
HtLsFRQVXGNw8DJBi5Q1j/YP8iVH3KzS3+LwVazVhJFuhbjlfUZYZLjzmv2PAr6mW710Dfv5yVtl
bfR1INT2k6CuIffLQW7qeIo6rZUhTADs17N1HqowTSvLu2fBkaHKxNyAggWIwT4gvtdJtMJ03Q+v
xnEk8pIhUKorA2iY/yk88YGnyXwrJUEsqiAU/yCi32TXL37NRPt76dsZPS4WJeXUJ2+tcto1Rzur
koyldwRh66pzUpgFZYBvM5KZY6vW77+CYUN2QIFBc7WWsF0EcuZQHmVkKaFI1yIINF0ZVIelXByb
nh4=
=Ycyy
-----END PGP SIGNATURE-----

--------------788T3eX9uGKbgsAhXWxKYVlB--
