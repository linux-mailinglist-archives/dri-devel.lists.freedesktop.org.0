Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D649C490860
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 13:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C230010E223;
	Mon, 17 Jan 2022 12:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C810E223
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 12:13:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 281B5212BC;
 Mon, 17 Jan 2022 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642421595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52P+JCXUvTdLUWerxf9Q3K4IFq27GDPPNOqzBPP/jKI=;
 b=bwkkKGAv+QFN70hS65w9jHVdBEBTUXDptytWQpedONf3O4NI5Ph0b6BdNqsLwjsTslJW9J
 8LQgf9CntJeFpgT/nRssmfZTEwqA1bhv/fJPtoCvLIiMcO80S7xOzscKKJOfTSk7Ut3s1T
 h8mIvneOYtiiWuoFpfyM0AXy7Gdr0zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642421595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52P+JCXUvTdLUWerxf9Q3K4IFq27GDPPNOqzBPP/jKI=;
 b=higEdlH9JksAKYjOkI0MQa699+VY12enk1qs40dv/4dBMFYYzZlOkY/iBIKFpPZa34ZA0Q
 wKLIaPpAe8K1oeBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A4AC13D3C;
 Mon, 17 Jan 2022 12:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id abCKAVtd5WEQFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 12:13:15 +0000
Message-ID: <9a9b2189-4517-81f6-1658-bb2a3a8be310@suse.de>
Date: Mon, 17 Jan 2022 13:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <9814d071-2a01-f452-8bf9-4d216a11186d@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9814d071-2a01-f452-8bf9-4d216a11186d@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BOZbLFy0jBe8ypQ2mIeHPCjQ"
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BOZbLFy0jBe8ypQ2mIeHPCjQ
Content-Type: multipart/mixed; boundary="------------Ow0GBq57NadfxD6evuIyIrLh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <9a9b2189-4517-81f6-1658-bb2a3a8be310@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <9814d071-2a01-f452-8bf9-4d216a11186d@gmx.de>
In-Reply-To: <9814d071-2a01-f452-8bf9-4d216a11186d@gmx.de>

--------------Ow0GBq57NadfxD6evuIyIrLh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTI6MzMgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIDEvMTcvMjIgMTI6MTYsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxNC4wMS4yMiB1bSAxOToxMSBzY2hyaWViIEhlbGdl
IERlbGxlcjoNCj4+PiBUaGUgZmJkZXYgbGF5ZXIgaXMgb3JwaGFuZWQsIGJ1dCBzZWVtcyB0
byBuZWVkIHNvbWUgY2FyZS4NCj4+PiBTbyBJJ2QgbGlrZSB0byBzdGVwIHVwIGFzIG5ldyBt
YWludGFpbmVyLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSGVsZ2UgRGVsbGVyIDxkZWxs
ZXJAZ214LmRlPg0KPj4NCj4+IEZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciBzdGVwcGlu
ZyB1cCB0byBtYWludGFpbiB0aGUgZmJkZXYNCj4+IGNvZGViYXNlLiBJdCByZWFsbHkgbmVl
ZHMgc29tZW9uZSBhY3RpdmVseSBsb29raW5nIGFmdGVyIGl0Lg0KPiANCj4gVGhhbmtzLg0K
PiANCj4+IEFuZCBub3cgY29tZXMgdGhlIEJVVC4NCj4+DQo+PiBJIHdhbnQgdG8gc2Vjb25k
IGV2ZXJ5dGhpbmcgc2FpZCBieSBEYW5pYWwgYW5kIEphdmllci4gSW4gYWRkaXRpb24gdG8N
Cj4+IHB1cmVseSBvcmdhbml6YXRpb25hbCB0b3BpY3MgKHRyZWVzLCBQUnMsIGV0YyksIHRo
ZXJlIGFyZSBhIG51bWJlciBvZg0KPj4gaW5oZXJpdCBwcm9ibGVtcyB3aXRoIGZiZGV2Lg0K
PiANCj4gSSB3aWxsIGFuc3dlciB0aGF0IGluIHRoZSBvdGhlciBtYWlsIHRvIERhbmllbCBz
aG9ydGx5Li4uDQo+IA0KPj4gKiBJdCdzIDkwcyB0ZWNobm9sb2d5LiBOZWl0aGVyIGRvZXMg
aXQgZml0IHRvZGF5J3MgdXNlcnNwYWNlLCBub3QNCj4+IGhhcmR3YXJlLiBJZiB5b3UgaGF2
ZSBtb3JlIHRoYW4ganVzdCB0aGUgbW9zdCB0cml2aWFsIG9mIGdyYXBoaWNhbA0KPj4gb3V0
cHV0IGZiZGV2IGlzbid0IGZvciB5b3UuDQo+IA0KPiBSaWdodC4NCj4gSSdtIHdvcmtpbmcg
YW5kIG1haW50YWluaW5nIHN1Y2ggaGFyZHdhcmUuDQo+IFRoZXJlIGlzIG5vdCBqdXN0IHg4
NiwgdGhlcmUgaXMgbm90IGp1c3QgSW50ZWwvQU1EL252aWRpYSBncmFwaGljcw0KPiBhbmQg
Zm9yIHRob3NlIGZiZGV2IGlzIHN0aWxsIChhbmQgd2lsbCBiZSkgaW1wb3J0YW50Lg0KPiAN
Cj4+ICogVGhlcmUncyBubyBuZXcgZGV2ZWxvcG1lbnQgaW4gZmJkZXYgYW5kIHRoZXJlIGFy
ZSBubyBuZXcgZHJpdmVycy4NCj4+IEV2ZXJ5b25lIHdvcmtzIG9uIERSTSwgd2hpY2ggaXMg
YmV0dGVyIGluIG1vc3QgcmVnYXJkcy4NCj4gDQo+IEluIG1vc3QgcmVnYXJkcyB5ZXMuDQo+
IFNvLCBkb24ndCBnZXQgbWUgd3JvbmcuDQo+IEkgZnVsbHkgYWdyZWUgRFJNIHRoYXQgaXMg
dGhlIHdheSBmb3J3YXJkLg0KPiBCdXQgb24gdGhlIHdheSBmb3J3YXJkIHdlIHNob3VsZG4n
dCB0cnkgdG8gYWN0aXZlbHkgYnJlYWsgY29kZSBmb3Igb3RoZXJzLg0KDQpXZSBkb24ndCBh
Y3RpdmVseSBicmVhayBmYmRldiBmb3IgYW55b25lLiBBY3R1YWxseSwgYWZ0ZXIgfjIweXJz
IHdlIA0KZmluYWxseSBhZGRlZCB0ZXN0Y2FzZXMgZm9yIGZiZGV2IGlvY3Rscywgc28gdGhh
dCB3ZSBhdm9pZCByZWdyZXNzaW9ucy4NCg0KPiANCj4+IFRoZSBjb25zZXF1ZW5jZSBpcyB0
aGF0IHVzZXJzcGFjZSBpcyBzbG93bHkgbG9vc2luZyB0aGUgYWJpbGl0eSB0bw0KPj4gdXNl
IGZiZGV2Lg0KPiBNYXliZS4NCg0KVGhlcmUgbWlnaHQgYmUgb3V0bGllcnMsIGJ1dCBJIGRv
bid0IHRoaW5rIHRoZSBMaW51eCBkZXNrdG9wcyBzdXBwb3J0IA0KZmJkZXYgaW4gV2F5bGFu
ZCBtb2RlLiBGb3IgV2VzdG9uLCB0aGUgbGFzdCB0aGluZyBJIGhlYXJkIHdhcyB0aGF0IGZi
ZGV2IA0KaXMgc3VwcG9zZWQgdG8gYmUgZHJvcHBlZCBpbiBvbmUgb2YgdGhlIG5leHQgcmVs
ZWFzZXMuDQoNCkZiZGV2IGlzIG1vc3RseSBoYW5kbGVkIGJ5IG9sZCBYb3JnIG9yIG1heWJl
IHdoYXRldmVyIGVtYmVkZGVkIHZlbmRvcnMgDQppbXBsZW1lbnQuIE5vdGUgdGhlIERSTSBk
cml2ZXJzIHN0aWxsIHN1cHBvcnQgZmJkZXYgaW50ZXJmYWNlcyB2aWEgDQovZGV2L2ZiKiBm
b3IgbGVnYWN5IHVzZXJzcGFjZS4NCg0KPiANCj4+ICogQSBmZXcgdXNlLWNhc2VzIGZvciBl
ZmlmYiByZW1haW4sIGJ1dCBkaXN0cmlidXRpb25zIGFyZSBhY3RpdmVseQ0KPj4gbW92aW5n
IGF3YXkgZnJvbSBmYmRldi4gSSBrbm93IHRoYXQgYXQgbGVhc3Qgb3BlblNVU0UsIEZlZG9y
YSBhbmQNCj4+IEFscGluZSBkbyB0aGlzLg0KPiANCj4gRGViaWFuIGlzIHN0aWxsIHJ1bm5p
bmcgb24gbG90cyBvZiBoYXJkd2FyZSwgZWl0aGVyIHdoaWNoIGlzbid0IHg4NiBvcg0KPiB3
aGljaCBpcyBvbGQgaGFyZHdhcmUuDQo+IFRoZSBkaXN0cmlidXRpb25zIHlvdSBtZW50aW9u
ZWQgc3RpbGwgbmVlZCBmYmRldiBmb3IgbWFjaGluZXMgd2VyZSBEUk0gaXNuJ3QNCj4gYXZh
aWxhYmxlICh5ZXQpLg0KDQpOb3QgcmVhbGx5LiBGcm9tIFsxXSwgQWxwaW5lIGFwcGFyZW50
bHkgc3dpdGNoZWQgYWxyZWFkeS4gb3BlblNVU0UgWzJdIA0KYW5kIEZlZG9yYSBbM10gYXJl
IGluIHRoZSBwcm9jZXNzIG9mIGRvaW5nIHNvLiBEZWJpYW4gY2FuIGVhc2lseSBmb2xsb3cu
DQoNCldlIG5vdyBkbyBoYXZlIHRoZSBhYmlsaXR5IHRvIHJ1biBEUk0gZnJvbSBlYXJseSBz
dGFnZXMgb2YgdGhlIGJvb3QgDQpwcm9jZXNzIHdpdGhvdXQgdGhlIG5lZWQgZm9yIGZiZGV2
LiBXaGF0IHdlIHN0aWxsIHVzZSBpcyB0aGUgZmJjb24gDQpjb25zb2xlLiBUaGVyZSBhcmUg
aWRlYXMgdG8gcmVwbGFjZSB0aGF0IGFzIHdlbGwuDQoNCj4gDQo+PiBJJ2QgbGlrZSB0byBo
ZWFyIHdoYXQgeW91ciBwbGFucyBhcmUgZm9yIGZiZGV2Pw0KPiANCj4gVGhhdCdzIGVhc3k6
DQo+ICogVG8gbWFpbnRhaW4gaXQuDQo+ICogVG8ga2VlcCBpdCB3b3JraW5nIGZvciB3aGVy
ZSBEUk0gY2FuJ3QgYmUgdXNlZC4NCj4gKiBNeSBnb2FsIGlzIE5PVCB0byB3b3JrIGFnYWlu
c3QgRFJNLiBUaGF0J3MgdGhlIGZ1dHVyZSBvZiBjb3Vyc2UuDQo+IA0KDQpJTUhPIHRoYXQg
c2Vjb25kIGJ1bGxldCByZWFsbHkgbWlzc2VzIHRoZSBwb2ludC4gRFJNIGNhbiBiZSB1c2Vk
IHdoZXJlIA0KZXZlciBmYmRldiBpcyBzdGlsbCByZXF1aXJlZC4gVGhlIG9ubHkgdGhpbmcg
c3RvcHBpbmcgaXQgaXMgdGhlIA0KYXZhaWxhYmlsaXR5IG9mIGEgaGFyZHdhcmUgZHJpdmVy
Lg0KDQpBIG1lYW5pbmcgY29udHJpYnV0aW9uIHdvdWxkIGJlIHRvIHBvcnQgZmJkZXYgZHJp
dmVycyBvdmVyIHRvIERSTS4gVGhhdCANCm1ha2VzIG1vZGVybiBmZWF0dXJlcyBhdmFpbGFi
bGUgb24gdGhhdCBoYXJkd2FyZSBpbiBib3RoLCBrZXJuZWwgYW5kIA0KdXNlcnNwYWNlLiBX
ZSBkbyB0YWtlIGRyaXZlcnMgZm9yIG9sZCBoYXJkd2FyZS4gSSBldmVuIG1hZGUgDQpmYmRl
di1jb252ZXJzaW9uIGhlbHBlcnMgYSB3aGlsZSBhZ28uIFs0XQ0KDQpJZiB5b3UgY2FuIHBv
aW50IHRvIGdyYXBoaWNzIGhhcmR3YXJlIHRoYXQgc2hvdWxkIGhhdmUgYSBEUk0gZHJpdmVy
LCANCkknbGwgaGVscCBhbnkgdm9sdW50ZWVycyB3aXRoIHRoZSBjb252ZXJzaW9uLg0KDQpC
dXQga2VlcGluZyBmYmRldiBhbGl2ZSBmb3Igc3VjaCBoYXJkd2FyZSBvbmx5IGNvbnRyaWJ1
dGVzIHRvIHRoZSANCmZyYWdtZW50YXRpb24gYW5kIG1ha2VzIHRoZXNlIHN5c3RlbXMgZXZl
biBtb3JlIG9ic29sZXRlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gaHR0cHM6
Ly93d3cucGhvcm9uaXguY29tL3NjYW4ucGhwP3BhZ2U9bmV3c19pdGVtJnB4PUFscGluZS1M
aW51eC0zLjE1DQpbMl0gaHR0cHM6Ly9idWd6aWxsYS5vcGVuc3VzZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTExOTMyNTANClszXSBodHRwczovL2ZlZG9yYXByb2plY3Qub3JnL3dpa2kvQ2hh
bmdlcy9SZXBsYWNlRmJkZXZEcml2ZXJzDQpbNF0gDQpodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvdHppbW1lcm1hbm4vbGludXgvLS90cmVlL2ZiY29udi1wbHVzLWRyaXZlcnMN
Cg0KPiBIZWxnZQ0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+Pj4gaW5k
ZXggNWQwY2Q1Mzc4MDNhLi5jZTQ3ZGJjNDY3Y2MgMTAwNjQ0DQo+Pj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4+PiArKysgYi9NQUlOVEFJTkVSUw0KPj4+IEBAIC03NTgzLDExICs3NTgzLDEy
IEBAIFc6wqDCoMKgIGh0dHA6Ly9mbG9hdGluZ3BvaW50LnNvdXJjZWZvcmdlLm5ldC9lbXVs
YXRvci9pbmRleC5odG1sDQo+Pj4gIMKgIEY6wqDCoMKgIGFyY2gveDg2L21hdGgtZW11Lw0K
Pj4+DQo+Pj4gIMKgIEZSQU1FQlVGRkVSIExBWUVSDQo+Pj4gLUw6wqDCoMKgIGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiArTTrCoMKgwqAgSGVsZ2UgRGVsbGVyIDxk
ZWxsZXJAZ214LmRlPg0KPj4+ICDCoCBMOsKgwqDCoCBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcNCj4+PiAtUzrCoMKgwqAgT3JwaGFuDQo+Pj4gK0w6wqDCoMKgIGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiArUzrCoMKgwqAgTWFpbnRhaW5lZA0KPj4+ICDC
oCBROsKgwqDCoCBodHRwOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1m
YmRldi9saXN0Lw0KPj4+IC1UOsKgwqDCoCBnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1taXNjDQo+Pj4gK1Q6wqDCoMKgIGdpdCBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGVsbGVyL2xpbnV4LWZiZGV2LmdpdA0K
Pj4+ICDCoCBGOsKgwqDCoCBEb2N1bWVudGF0aW9uL2ZiLw0KPj4+ICDCoCBGOsKgwqDCoCBk
cml2ZXJzL3ZpZGVvLw0KPj4+ICDCoCBGOsKgwqDCoCBpbmNsdWRlL2xpbnV4L2ZiLmgNCj4+
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Ow0GBq57NadfxD6evuIyIrLh--

--------------BOZbLFy0jBe8ypQ2mIeHPCjQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHlXVoFAwAAAAAACgkQlh/E3EQov+Ao
xBAA0K81iIxdE9UbknIKvZp3pJQyVIVuHKPWbb9Xg0du8K7dRnILqJJPjsDKNmRnjJYTpucbj51o
IyjMb2fQ2x5uQiKd2446RjHL6vbvTFLiB7FtCbWtbgLKNe1wU5Q19vaFwvzo+zVIm9S8PTeKmM/L
89I+RlXUaoELJ7H8faNM0sH44F8xrPkghE/JM5hv2TckW0+8FNReo/4A9qDhnYiqgX46N7Kq8jHE
AZfkVJRGBeNxt7pg2jOW98wK2KD77KBAQTpyQcngTsmeInHArmLDuJyg/a3opV3dNNDUzn8+2/bd
5Ygh7DEQGop8xEtUsAUBG9vaajspKTrc1PzW7Nx5+nzABatfpkAh4YhVGJ8dHIgKUC0cEagNz0L2
u7brdH6thxZio0dUwfMaLjabXZ1d6z97EDXwP31+J3arOr0kpxRwrFJwzhAXVk8Xlpp74vT0HQOA
nbGMBZrPhAijxgvVa2gD0h5k/8cDctG8pesDM1lFGYY8VftCsTzD92pvT0W9usB6mh0cuSK3AOBV
VRsXD6smsBDZ3oLMmfGIWJLTlrQWm8rOM55E0DtUKbfOVy7DDh6qogqVH1TKhCRYNWT48iWAXAR7
J/3MWP8LknZiGVgy60OMW+oPrtPsZiFS5/OH0VNgJXdsxiuepH9q7gjHvX12BAcyPBG01WWWCZvI
PM0=
=yBcX
-----END PGP SIGNATURE-----

--------------BOZbLFy0jBe8ypQ2mIeHPCjQ--
