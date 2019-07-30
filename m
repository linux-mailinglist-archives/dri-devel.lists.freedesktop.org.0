Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7AA7A97C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDE26E4FE;
	Tue, 30 Jul 2019 13:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FFB6E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:28:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f17so56638270wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mq8GJjlIeOtHiR0sAMIF+b2NJD9oCDQdEVRSZ/tFXTs=;
 b=a0A68e3vnZ09VP2LuuAcqkMhz6lXMADgT19Q4Jg3i7pW6dHBMpGtwzamEuGUuRpp/l
 1oi1XXYppl7tEY8NQ04crzjqgf/n1qqIFMsBkC1gelU4mUFZPtibjxW1+NGqEYxqKx1F
 Pn/KCwaSu5Hj46yVmmg85AN/3Xt637kkxl4eWNniyNDJn2Lph+bsT+lkOMxmEczenFBX
 GSoL1Pdti/uMkotAp3zFJKd89G/SLXHGzJ9CMh7UmH7GcvPB07ethJgd4vlDuILMtEoW
 bDBJQR/Snwb4XwL9w/LTKcEin2f5bu4CxC8qkEIhz4CH9oyw8kEi9/1etGSqlmvhTGf4
 CPGA==
X-Gm-Message-State: APjAAAXVhrbJAMLsW0DbAnAOka5clVfiYOHZrT2XJlCl7b6h7ZJocRel
 UIyEtLL6LBF3kdAru+/t1ReLdjUCa78=
X-Google-Smtp-Source: APXvYqz+ydNXtrj8jBjLR9pLJ9RGchZ1mYmltQxJrzsOtl8gy/mVOqaHBePLqJTRoinJyx3D11LfMg==
X-Received: by 2002:a1c:630a:: with SMTP id
 x10mr110885671wmb.113.1564492748735; 
 Tue, 30 Jul 2019 06:19:08 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id n12sm67664755wmc.24.2019.07.30.06.19.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 06:19:08 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fc848de3-93b3-5299-261d-475b7277cb83@redhat.com>
Date: Tue, 30 Jul 2019 15:19:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725105132.22545-2-noralf@tronnes.org>
Content-Language: en-US
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyNS0wNy0xOSAxMjo1MSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IFRoaXMgbWFr
ZXMgdGhlIHRpbnkgZHJpdmVycyB2aXNpYmxlIGJ5IGRlZmF1bHQgd2l0aG91dCBoYXZpbmcgdG8g
ZW5hYmxlIGEKPiBrbm9iLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9y
YWxmQHRyb25uZXMub3JnPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAg
ICB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnIHwgMzcgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGlueWRybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+IGlu
ZGV4IDQyYjA2ZjRmODk4OS4uZjhjOWEwZTcxZGRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90aW55ZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29u
ZmlnCj4gQEAgLTEsMTYgKzEsOSBAQAo+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Cj4gLW1lbnVjb25maWcgRFJNX1RJTllEUk0KPiAtCXRyaXN0YXRlICJTdXBwb3J0
IGZvciBzaW1wbGUgZGlzcGxheXMiCj4gLQlkZXBlbmRzIG9uIERSTQo+IC0Jc2VsZWN0IERSTV9L
TVNfSEVMUEVSCj4gLQlzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4gLQloZWxwCj4gLQkgIENo
b29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIHRpbnlkcm0gc3VwcG9ydGVkIGRpc3BsYXku
Cj4gLQkgIElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCB0aW55ZHJt
Lgo+IC0KPiAgIGNvbmZpZyBUSU5ZRFJNX0hYODM1N0QKPiAgIAl0cmlzdGF0ZSAiRFJNIHN1cHBv
cnQgZm9yIEhYODM1N0QgZGlzcGxheSBwYW5lbHMiCj4gLQlkZXBlbmRzIG9uIERSTV9USU5ZRFJN
ICYmIFNQSQo+ICsJZGVwZW5kcyBvbiBEUk0gJiYgU1BJCj4gKwlzZWxlY3QgRFJNX0tNU19IRUxQ
RVIKPiArCXNlbGVjdCBEUk1fS01TX0NNQV9IRUxQRVIKPiAgIAlzZWxlY3QgRFJNX01JUElfREJJ
Cj4gICAJc2VsZWN0IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiAgIAloZWxwCgo8c25pcD4KCmRy
aXZlcnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxlIGhhczoKCm9iai0kKENPTkZJR19EUk1fVElO
WURSTSkgICAgICAgICAgICAgICArPSBjb3JlLwoKQW5kIEFGQUlLIGF0IGxlYXN0IG1vc3Qgb2Yg
dGhlIGRyaXZlcnMgdW5kZXIgZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0KYWN0dWFsbHkgbmVlZCB0
aGUgdGlueWRybS1jb3JlLgoKU28gaW5zdGVhZCB5b3Ugc2hvdWxkIG1ha2UgdGhlIGNvbmZpZyBv
cHRpb24gYSBoaWRkZW4gb25lCmFuZCBzZWxlY3QgaXQgaW4gYWxsIHRoZSBkcml2ZXJzIHdoaWNo
IG5lZWQgaXQsIG90aGVyd2lzZQp0aGluZ3Mgd2lsbCBubyBsb25nZXIgd29yayBhZnRlciBhIGNs
ZWFuIGJ1aWxkIEFGQUlDVC4KCk5vdGUgdGhhdCBldmVuIHRob3VnaCB0aGUgY29uZmlnIG9wdGlv
biBub3cgcmVtYWlucywgdGhpcyBjaGFuZ2U6CgogPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCiA+IGluZGV4IDk4YzczMmY5
MjVjNy4uMGIzMGFmYTc1MjRkIDEwMDY0NAogPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZp
bGUKID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCiA+IEBAIC0xMTIsNyArMTEyLDcg
QEAgb2JqLSQoQ09ORklHX0RSTV9BUkNQR1UpKz0gYXJjLwogPiAgIG9iai15CQkJKz0gaGlzaWxp
Y29uLwogPiAgIG9iai0kKENPTkZJR19EUk1fWlRFKQkrPSB6dGUvCiA+ICAgb2JqLSQoQ09ORklH
X0RSTV9NWFNGQikJKz0gbXhzZmIvCiA+IC1vYmotJChDT05GSUdfRFJNX1RJTllEUk0pICs9IHRp
bnlkcm0vCiA+ICtvYmoteQkJCSs9IHRpbnlkcm0vCiA+ICAgb2JqLSQoQ09ORklHX0RSTV9QTDEx
MSkgKz0gcGwxMTEvCiA+ICAgb2JqLSQoQ09ORklHX0RSTV9UVkUyMDApICs9IHR2ZTIwMC8KID4g
ICBvYmotJChDT05GSUdfRFJNX1hFTikgKz0geGVuLwoKSXMgc3RpbGwgbmVjZXNzYXJ5IHNvIHRo
YXQgd2hlbiBvdGhlciBkcml2ZXJzIHdoaWNoIGRvIG5vdApkZXBlbmQgb24gdGhlIHRpbnlkcm0g
Y29yZSBhbmQgdGh1cyB3aWxsIG5vdCBkbzoKCXNlbGVjdCBEUk1fVElOWURSTQp3aWxsIHN0aWxs
IGdldCBidWlsZC4KCk90aGVyd2lzZSB0aGlzIHNlcmllcyBsb29rcyBnb29kIHRvIG1lIGFuZCB5
b3UgY2FuIGFkZCBteToKClJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPiB0byBpdCBvbmNlCnRoaXMgaXMgZml4ZWQuCgpOb3RlIHRoYXQgZHJpdmVycy9ncHUv
ZHJtL2NpcnJ1cyBpcyBhIHNpbmdsZSAuYyBmaWxlIHRpbnkKZHJpdmVyIG5vdyBhIGRheXMgdG9v
LCBzbyBpdCB0b28gY291bGQgYmUgbW92ZWQgdG8gdGhlIG5ldwp0aW55IGRpci4gSSB3YXMgYWN0
dWFsbHkgcGxhbm5pbmcgb24gZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIKdG8gdGhpcyBzZXJpZXMg
b25jZSBJIGdvdCBvbmUgbW9yZSB0aW55IGRyaXZlciB1cHN0cmVhbSA6KQoKUmVnYXJkcywKCkhh
bnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
