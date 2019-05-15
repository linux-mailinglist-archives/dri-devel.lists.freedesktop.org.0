Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96320021
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC80F892EF;
	Thu, 16 May 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback16.mail.ru (fallback16.mail.ru [94.100.177.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3962E8941E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 10:34:06 +0000 (UTC)
Received: from [10.161.63.6] (port=59412 helo=f383.i.mail.ru)
 by fallback16.i with esmtp (envelope-from <shc_work@mail.ru>)
 id 1hQrEZ-000827-VM; Wed, 15 May 2019 13:34:04 +0300
Received: by f383.i.mail.ru with local (envelope-from <shc_work@mail.ru>)
 id 1hQrEU-0001jy-3j; Wed, 15 May 2019 13:33:58 +0300
Received: by e.mail.ru with HTTP;
	Wed, 15 May 2019 13:33:57 +0300
From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
To: =?UTF-8?B?R2VlcnQgVXl0dGVyaG9ldmVu?= <geert@linux-m68k.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAxLzJdIHZpZGVvOiBsY2Q6IFJlbW92ZSB1c2VsZXNz?=
 =?UTF-8?B?IEJBQ0tMSUdIVF9MQ0RfU1VQUE9SVCBrZXJuZWwgc3ltYm9s?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
Date: Wed, 15 May 2019 13:33:57 +0300
X-Priority: 3 (Normal)
Message-ID: <1557916437.354393786@f383.i.mail.ru>
X-77F55803: 96E0DF80B331F2A37F9F52485CB584D7ADE63D71A4B1B0B85A1EF668FCECE843A477A93F8B611FC61AD76BF7C8BC26CA660823B2EEFD31DC
X-7FA49CB5: 70AAF3C13DB70168C09775C1D3CA48CFF94D3DC5184210B4CEDC9CE4EAAF8441BD4B6F7A4D31EC0B5B47ED7565F4D52D9742502CCDD46D0D1F9513A7CA91E555B2086D80B05047785571747095F342E8C7A0BC55FA0FE5FCC1847E8206020841538232B81C8A8CA9AEAE445ACCC4DACE389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE717D1CE6993D33C6B9AF23DDBA87A816375ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57285124B2A10EEC6C00306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 8261CADE3D3FA0B4C2F1292954F703E9E5BD43DFC6539102A105C61D2D92E376352FA8C38B6F466D6208B0701A251B27346D653DC8F96EBFDC7E5DB24DA7E57B1937939186396399F4ED1D881B4DF0A5EE23CE02E1CB6F8C5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
X-Spam: undefined
In-Reply-To: <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
References: <20190117133336.19737-1-shc_work@mail.ru>
 <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
X-77F55803: 6AF0DA0BABFA9FDB7F9F52485CB584D7271FD7DF62800FDC7404E55ECAA11931A78268D86148178301EEED81FC4BBCD62E99995F3FC63007
X-Mras: OK
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mail.ru; s=mail2; 
 h=References:In-Reply-To:Content-Transfer-Encoding:Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:Cc:To:From;
 bh=X26CkSxKDh8MQ5G1daXdqDr8XcsNIAyu30yV9jHHZcs=; 
 b=DfybKzrviD+Q3Vv6WNt/0QWvuFG7UhCfqt5Dy4/YokVhxvcKpx3S2SPG2CDSVsZhu4+25eOrgXYLtc1bQwvYNW2jd2joCSny9W/LLGJ3erQ1+diMVEPDJ71ETRfW8Yn96w2HFby8J7fERS/PuuhTZtr6l/3pYl5SDbIkuXGIgdc=;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mail.ru; s=mail2; 
 h=References:In-Reply-To:Content-Transfer-Encoding:Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:Cc:To:From;
 bh=X26CkSxKDh8MQ5G1daXdqDr8XcsNIAyu30yV9jHHZcs=; 
 b=DfybKzrviD+Q3Vv6WNt/0QWvuFG7UhCfqt5Dy4/YokVhxvcKpx3S2SPG2CDSVsZhu4+25eOrgXYLtc1bQwvYNW2jd2joCSny9W/LLGJ3erQ1+diMVEPDJ71ETRfW8Yn96w2HFby8J7fERS/PuuhTZtr6l/3pYl5SDbIkuXGIgdc=;
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
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Cc: =?UTF-8?B?TGludXggRmJkZXYgZGV2ZWxvcG1lbnQgbGlzdA==?=
 <linux-fbdev@vger.kernel.org>,
 =?UTF-8?B?QmFydGxvbWllaiBab2xuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>,
 =?UTF-8?B?SmluZ29vIEhhbg==?= <jingoohan1@gmail.com>,
 =?UTF-8?B?RGFuaWVsIFRob21wc29u?= <daniel.thompson@linaro.org>,
 =?UTF-8?B?RFJJIERldmVsb3BtZW50?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TGVlIEpvbmVz?= <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8uCgpMb29rcyBsaWtlIHlvdSdyZSByaWdodC4KQ2FuIHlvdSBjcmVhdGUgYSBwYXRjaCB0
byBmaXggdGhpcz8KClRoYW5rcy4KCgo+0KHRgNC10LTQsCwgMTUg0LzQsNGPIDIwMTksIDExOjU3
ICswMzowMCDQvtGCIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ogo+
Cj5IaSBBbGV4YW5kZXIsCj4KPk9uIFRodSwgSmFuIDE3LCAyMDE5IGF0IDI6MzkgUE0gQWxleGFu
ZGVyIFNoaXlhbiA8IHNoY193b3JrQG1haWwucnUgPiB3cm90ZToKPj4gV2UgaGF2ZSB0d28gKl9D
TEFTU19ERVZJQ0Uga2VybmVsIGNvbmZpZyBvcHRpb25zIChMQ0RfQ0xBU1NfREVWSUNFCj4+IGFu
ZCBCQUNLTElHSFRfTENEX0RFVklDRSkgdGhhdCBkbyB0aGUgc2FtZSBqb2IuCj4+IFRoZSBwYXRj
aCByZW1vdmVzIHVzZWxlc3MgQkFDS0xJR0hUX0xDRF9TVVBQT1JUIG9wdGlvbgo+PiBhbmQgY29u
dmVydHMgTENEX0NMQVNTX0RFVklDRSBpbnRvIGEgbWVudS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIFNoaXlhbiA8IHNoY193b3JrQG1haWwucnUgPgo+VGhpcyBpcyBub3cgY29tbWl0
IDhjNWRjOGQ5ZjE5Yzc5OTIgKCJ2aWRlbzogYmFja2xpZ2h0OiBSZW1vdmUgdXNlbGVzcwo+QkFD
S0xJR0hUX0xDRF9TVVBQT1JUIGtlcm5lbCBzeW1ib2wiKS4KPgo+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tj
b25maWcKPj4gQEAgLTIsMTMgKzIsNyBAQAo+PiAgIyBCYWNrbGlnaHQgJiBMQ0QgZHJpdmVycyBj
b25maWd1cmF0aW9uCj4+ICAjCj4+Cj4+IC1tZW51Y29uZmlnIEJBQ0tMSUdIVF9MQ0RfU1VQUE9S
VAo+PiAtICAgICAgIGJvb2wgIkJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydCIKPj4gLSAg
ICAgICBoZWxwCj4+IC0gICAgICAgICBFbmFibGUgdGhpcyB0byBiZSBhYmxlIHRvIGNob29zZSB0
aGUgZHJpdmVycyBmb3IgY29udHJvbGxpbmcgdGhlCj4+IC0gICAgICAgICBiYWNrbGlnaHQgYW5k
IHRoZSBMQ0QgcGFuZWwgb24gc29tZSBwbGF0Zm9ybXMsIGZvciBleGFtcGxlIG9uIFBEQXMuCj4+
IC0KPj4gLWlmIEJBQ0tMSUdIVF9MQ0RfU1VQUE9SVAo+PiArbWVudSAiQmFja2xpZ2h0ICYgTENE
IGRldmljZSBzdXBwb3J0Igo+Pgo+PiAgIwo+PiAgIyBMQ0QKPgo+QmVsb3csIHdlIGhhdmU6Cj4K
PsKgwqDCoMKgY29uZmlnIExDRF9DTEFTU19ERVZJQ0UKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHRyaXN0YXRlICJMb3dsZXZlbCBMQ0QgY29udHJvbHMiCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkZWZhdWx0IG0KPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhlbHAKPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBUaGlzIGZyYW1ld29yayBhZGRzIHN1cHBvcnQgZm9yIGxvdy1sZXZlbCBj
b250cm9sIG9mIExDRC4KPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBTb21lIGZyYW1lYnVm
ZmVyIGRldmljZXMgY29ubmVjdCB0byBwbGF0Zm9ybS1zcGVjaWZpYyBMQ0QgbW9kdWxlcwo+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGluIG9yZGVyIHRvIGhhdmUgYSBwbGF0Zm9ybS1zcGVj
aWZpYyB3YXkgdG8gY29udHJvbCB0aGUgZmxhdCBwYW5lbAo+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoChjb250cmFzdCBhbmQgYXBwbHlpbmcgcG93ZXIgdG8gdGhlIExDRCAobm90IHRvIHRo
ZSBiYWNrbGlnaHQhKSkuCj4KPmFuZDoKPgo+wqDCoMKgwqBjb25maWcgQkFDS0xJR0hUX0NMQVNT
X0RFVklDRQo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHJpc3RhdGUgIkxvd2xldmVsIEJhY2ts
aWdodCBjb250cm9scyIKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQgbQo+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaGVscAo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFRoaXMg
ZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgdGhlIExDRAo+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhY2tsaWdodC4gVGhpcyBpbmNsdWRlcyBzdXBw
b3J0IGZvciBicmlnaHRuZXNzIGFuZCBwb3dlci4KPgo+SGVuY2UgcnVubmluZyAibWFrZSBvbGRj
b25maWciIG9uIGEgLmNvbmZpZyB3aGVyZQo+Q09ORklHX0JBQ0tMSUdIVF9MQ0RfU1VQUE9SVCB3
YXMgbm90IHNldCBsZWFkcyB0d28gdG8gbmV3Cj5xdWVzdGlvbnMsIHdoZXJlIHRoZSBhbnN3ZXJz
IGRlZmF1bHQgdG8gIm0iLgo+Cj5QZXJoYXBzIHRoZSAiZGVmYXVsdCBtIiBzdGF0ZW1lbnRzIHNo
b3VsZCBiZSByZW1vdmVkPwoKLS0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
