Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F783175563
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0606E0F2;
	Mon,  2 Mar 2020 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92526E3A8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 19:46:49 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id m2so6399531qka.7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=pULnrrVY805Am11MojiVk5xmIvzlywD1lMqf3jDS+Mg=;
 b=ArRcFKOvDvGCveuLvVFMFkv2qa+K7nkLaDjCnnYVjPrHwr7H9GeQV98ud/tw0g+hX2
 KoVZJ6Bxr3ivnS+kLbdOOvusJMhZ5thikXPiyKCU7N09NpOPadaAnxPjXnGRIN+khh7A
 AUxiURxwdk2GJflleX7fV2A3399aBosGLled6qJYb8d5lQzJ83YnpN9tO01rBuoxHTp/
 7NXqqUvNWo8zWTGqBCYT2EOio+wp8J4dNbM/zfGqXnYfammmvvP4NlutuE58vkD677aE
 eusNKOfYEKJQv7JjGHlPB9QPxoL0P6dGsBTYJ+C67y6tNNgCauEwfmf2nYCv5zLQh6fb
 90Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=pULnrrVY805Am11MojiVk5xmIvzlywD1lMqf3jDS+Mg=;
 b=dqszjcNEnGn5bRQe03H/2j/msQAEn5qIf4ePwmu3D5q0R+PbcXKlFfE594jqO6G9C6
 CZLTKNeEAq2tjMMkr6pPbpGNbPYHHnGOft/ODl9TWbYy/KQhf3LWPfN7K84Fmmt4P0jg
 CuPHp3GCVd3280sqMIagVo9OOxw+U+rzasZBiN1FlqQNmfdnTVjNqtRsRCQaPaBGgTvc
 jSFm0S/+zlOatujbR/aCoPBmVjLGhmXBmU0P52JHFgRWTtI432XtD3LqKJFgfS3bUqls
 TDD+vf2GwbNi5RDnorWtbPiZs7dDIRj6hXXzTWPU/qTqn/J1itE+u1QbyeSoAE8itWQT
 kDMw==
X-Gm-Message-State: APjAAAWYjM351EL+qZ5Mlv90hK17AxJmc0IAT3aA5s4LiFEk8PVZTCF/
 FEx2IjNMql/BO3et/cl7w7to/A==
X-Google-Smtp-Source: APXvYqy1WiAXv8nWD1UWgzd7yckR7OP/gjIifRUHgK3ai6OUitIdMkd6bEuO/+TiI4sbCDINEpBNfA==
X-Received: by 2002:a37:7245:: with SMTP id n66mr10446124qkc.202.1583005608943; 
 Sat, 29 Feb 2020 11:46:48 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id y62sm7307670qka.19.2020.02.29.11.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 11:46:47 -0800 (PST)
Message-ID: <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Daniel Stone
 <daniel@fooishbar.org>,  Erik Faye-Lund <erik.faye-lund@collabora.com>
Date: Sat, 29 Feb 2020 14:46:46 -0500
In-Reply-To: <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgc2FtZWRpIDI5IGbDqXZyaWVyIDIwMjAgw6AgMTk6MTQgKzAxMDAsIFRpbXVyIEtyaXN0w7Nm
IGEgw6ljcml0IDoKPiBPbiBGcmksIDIwMjAtMDItMjggYXQgMTA6NDMgKzAwMDAsIERhbmllbCBT
dG9uZSB3cm90ZToKPiA+IE9uIEZyaSwgMjggRmViIDIwMjAgYXQgMTA6MDYsIEVyaWsgRmF5ZS1M
dW5kCj4gPiA8ZXJpay5mYXllLWx1bmRAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgMjAyMC0wMi0yOCBhdCAxMTo0MCArMDIwMCwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4g
PiA+ID4gWWVhaCwgY2hhbmdlcyBvbiB2dWxrYW4gZHJpdmVycyBvciBiYWNrZW5kIGNvbXBpbGVy
cyBzaG91bGQgYmUKPiA+ID4gPiBmYWlybHkKPiA+ID4gPiBzYW5kYm94ZWQuCj4gPiA+ID4gCj4g
PiA+ID4gV2UgYWxzbyBoYXZlIHRvb2xzIHRoYXQgb25seSB3b3JrIGZvciBpbnRlbCBzdHVmZiwg
dGhhdCBzaG91bGQKPiA+ID4gPiBuZXZlcgo+ID4gPiA+IHRyaWdnZXIgYW55dGhpbmcgb24gb3Ro
ZXIgcGVvcGxlJ3MgSFcuCj4gPiA+ID4gCj4gPiA+ID4gQ291bGQgc29tZXRoaW5nIGJlIHdvcmtl
ZCBvdXQgdXNpbmcgdGhlIHRhZ3M/Cj4gPiA+IAo+ID4gPiBJIHRoaW5rIHNvISBXZSBoYXZlIHRo
ZSBwcmUtZGVmaW5lZCBlbnZpcm9ubWVudCB2YXJpYWJsZQo+ID4gPiBDSV9NRVJHRV9SRVFVRVNU
X0xBQkVMUywgYW5kIHdlIGNhbiBkbyB2YXJpYWJsZSBjb25kaXRpb25zOgo+ID4gPiAKPiA+ID4g
aHR0cHM6Ly9kb2NzLmdpdGxhYi5jb20vZWUvY2kveWFtbC8jb25seXZhcmlhYmxlc2V4Y2VwdHZh
cmlhYmxlcwo+ID4gPiAKPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBhIHByZXR0eSBuZWF0IG1pZGRs
ZS1ncm91bmQgdG8gbWUuIEkganVzdCBob3BlCj4gPiA+IHRoYXQKPiA+ID4gbmV3IHBpcGVsaW5l
cyBhcmUgdHJpZ2dlcmVkIGlmIG5ldyBsYWJlbHMgYXJlIGFkZGVkLCBiZWNhdXNlIG5vdAo+ID4g
PiBldmVyeW9uZSBpcyBhbGxvd2VkIHRvIHNldCBsYWJlbHMsIGFuZCBzb21ldGltZXMgcGVvcGxl
IGZvcmdldC4uLgo+ID4gCj4gPiBUaGVyZSdzIGFsc28gdGhpcyB3aGljaCBpcyBzb21ld2hhdCBt
b3JlIHJvYnVzdDoKPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2Ev
bWVyZ2VfcmVxdWVzdHMvMjU2OQo+IAo+IE15IDIwIGNlbnRzOgo+IAo+IDEuIEkgdGhpbmsgd2Ug
c2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJsZSBydW5uaW5nIHRoZSBDSSBvbiBNUnMgd2hpY2ggYXJl
Cj4gbWFya2VkIFdJUC4gU3BlYWtpbmcgZnJvbSBwZXJzb25hbCBleHBlcmllbmNlLCBJIHVzdWFs
bHkgbWFrZSBhIGxvdCBvZgo+IGNoYW5nZXMgdG8gbXkgTVJzIGJlZm9yZSB0aGV5IGFyZSBtZXJn
ZWQsIHNvIGl0IGlzIGEgd2FzdGUgb2YgQ0kKPiByZXNvdXJjZXMuCgpJbiB0aGUgbWVhbiB0aW1l
LCB5b3UgY2FuIGhlbHAgYnkgdGFraW5nIHRoZSBoYWJpdCB0byB1c2U6CgogIGdpdCBwdXNoIC1v
IGNpLnNraXAKCkNJIGlzIGluIGZhY3QgcnVuIGZvciBhbGwgYnJhbmNoZXMgdGhhdCB5b3UgcHVz
aC4gV2hlbiB3ZSAoR1N0cmVhbWVyClByb2plY3QpIHN0YXJ0ZWQgb3VyIENJIHdlIHdhbnRlZCB0
byBsaW1pdCB0aGlzIHRvIE1SLCBidXQgaGF2ZW4ndApmb3VuZCBhIGdvb2Qgd2F5IHlldCAoYW5k
IEdpdGxhYiBpcyBub3QgaGVscGluZyBtdWNoKS4gVGhlIG1haW4gaXNzdWUKaXMgdGhhdCBpdCdz
IG5lYXIgaW1wb3NzaWJsZSB0byB1c2UgZ2l0bGFiIHdlYiBBUEkgZnJvbSBhIHJ1bm5lcgoocmVx
dWlyZXMgcHJpdmF0ZSBrZXksIGluIGFuIGFsbCBvciBub3RoaW5nIG1hbm5lcikuIEJ1dCB3aXRo
IHRoZQpjdXJyZW50IHNpdHVhdGlvbiB3ZSBhcmUgcmV2aXNpdGluZyB0aGlzLgoKVGhlIHRydXRo
IGlzIHRoYXQgcHJvYmFibHkgZXZlcnkgQ0kgaGF2ZSBsb3Qgb2Ygcm9vbSBmb3Igb3B0aW1pemF0
aW9uLApidXQgaXQgY2FuIGJlIHJlYWxseSB0aW1lIGNvbnN1bWluZy4gU28gdW50aWwgd2UgaGF2
ZSBhIHJlYXNvbiB0bywgd2UKbGl2ZSB3aXRoIGluZWZmaWNpZW5jeSwgbGlrZSBvdmVyIHNpemVk
IGFydGlmYWN0LCB1bnVzZWQgYXJ0aWZhY3RzLApvdmVyLXNpemVkIGRvY2tlciBpbWFnZSwgZXRj
LiBEb2luZyBhIG5ldyByb3VuZCBvZiBvcHRpbWl6YXRpb24gaXMKb2J2aW91c2x5IGEgY2xlYXIg
c2hvcnQgdGVybSBnb2FscyBmb3IgcHJvamVjdCwgaW5jbHVkaW5nIEdTdHJlYW1lcgpwcm9qZWN0
LiBXZSBoYXZlIGRpc2N1c3Npb25zIGdvaW5nIG9uIGFuZCBhcmUgdHJ5aW5nIHRvIGZpbmQgc29s
dXRpb25zLgpOb3RhYmx5LCB3ZSB3b3VsZCBsaWtlIHRvIGdldCByaWQgb2YgdGhlIHBvc3QgbWVy
Z2UgQ0ksIGFzIGluIGEgcmViYXNlCmZsb3cgbGlrZSB3ZSBoYXZlIGluIEdTdHJlYW1lciwgaXQn
cyBhIHJlYWxseSBtaW5vciByaXNrLgoKPiAKPiAyLiBNYXliZSB3ZSBjb3VsZCB0YWtlIHRoaXMg
b25lIHN0ZXAgZnVydGhlciBhbmQgb25seSBhbGxvdyB0aGUgQ0kgdG8KPiBiZSBvbmx5IHRyaWdn
ZXJlZCBtYW51YWxseSBpbnN0ZWFkIG9mIGF1dG9tYXRpY2FsbHkgb24gZXZlcnkgcHVzaC4KPiAK
PiAzLiBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCBQaWVycmUtRXJpYyBvbiBNUiAyNTY5LCBsZXQn
cyBub3QgcnVuIHRoZQo+IGZ1bGwgQ0kgcGlwZWxpbmUgb24gZXZlcnkgY2hhbmdlLCBvbmx5IHRo
b3NlIHBhcnRzIHdoaWNoIGFyZSBhZmZlY3RlZAo+IGJ5IHRoZSBjaGFuZ2UuIEl0IG5vdCBvbmx5
IGNvc3RzIG1vbmV5LCBidXQgaXMgYWxzbyBmcnVzdHJhdGluZyB3aGVuCj4geW91IHN1Ym1pdCBh
IGNoYW5nZSBhbmQgeW91IGdldCB1bnJlbGF0ZWQgZmFpbHVyZXMgZnJvbSBhIGNvbXBsZXRlbHkK
PiB1bnJlbGF0ZWQgZHJpdmVyLgoKVGhhdCdzIGEgbXVjaCBtb3JlIGRpZmZpY3VsdCBnb2FsIHRo
ZW4gaXQgbG9va3MgbGlrZS4gTGV0IGVhY2ggcHJvamVjdHMKbWFuYWdlIHRoZWlyIENJIGdyYXBo
IGFuZCBjb250ZW50LCBhcyBlYWNoIGNhc2UgaXMgdW5pcXVlLiBSdW5uaW5nIG1vcmUKdGVzdHMs
IG9yIGJ1aWxkaW5nIG1vcmUgY29kZSBpc24ndCB0aGUgbWFpbiBpc3N1ZSBhcyB0aGUgQ1BVIHRp
bWUgaXMKbW9zdGx5IHNwb25zb3JlZC4gVGhlIGRhdGEgdHJhbnNmZXJzIGJldHdlZW4gdGhlIGNs
b3VkIG9mIGdpdGxhYiBhbmQKdGhlIHJ1bm5lcnMgKHdoaWNoIGFyZSBleHRlcm5hbCksIGFsb25n
IHRvIHNlbmRpbmcgT1MgaW1hZ2UgdG8gTGF2YQpsYWJzIGlzIHdoYXQgaXMgbGlrZWx5IHRoZSBt
b3N0IGV4cGVuc2l2ZS4KCkFzIGl0IHdhcyBhbHJlYWR5IG1lbnRpb24gaW4gdGhlIHRocmVhZCwg
d2hhdCB3ZSBhcmUgbWlzc2luZyBub3csIGFuZApiZWluZyB3b3JrZWQgb24sIGlzIHBlciBncm91
cC9wcm9qZWN0IHN0YXRpc3RpY3MgdGhhdCBnaXZlIHVzIHRoZQpob3RzcG90IHNvIHdlIGNhbiBi
ZXR0ZXIgdGFyZ2V0IHRoZSBvcHRpbWl6YXRpb24gd29yay4KCj4gCj4gQmVzdCByZWdhcmRzLAo+
IFRpbXVyCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBnc3RyZWFtZXItZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZ3N0cmVhbWVyLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZ3N0cmVhbWVyLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
