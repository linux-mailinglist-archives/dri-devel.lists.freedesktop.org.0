Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F8817555D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9526E0E4;
	Mon,  2 Mar 2020 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEF76E3E1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 22:20:41 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t13so4853498qto.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=l9GZeBnH2PlgEgNSsvcaZAM9Qu/cwRutN1QkTRPrWzA=;
 b=R23L3M8URLJLFayXEOrEy2quRJEmMR4UwP/ujtWMR35gK1Pd1Bicw12llnZv7/CbTv
 37MOWm8ZoqmeLN+BkIwL3akEQO6tu+iub3pC1rIh82zQSyyfQUG8C+D8UqifX/EExrWi
 m9MhYV7H4fhMVRjn5fIRoklnAoi8926kwMfkdXoaMs5+//ciZlfWVAo9kEb75qOPcEqM
 PyKSlZIxv3lXnZLEzKCWN88c60zOL+3MAL9aVmNQU/eLqCid9rRVLV0NNy4lAxrzHW/A
 VA2rnNupvhla+KC620WSqlYgTm17V0E1v8MipnhdbePkDEfEBDI4G8TZFYNwguOFrQEc
 cKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=l9GZeBnH2PlgEgNSsvcaZAM9Qu/cwRutN1QkTRPrWzA=;
 b=Mip3+WQ6ClXFot/PsNhOSvndjPrdI5sJWol4x7Kib3wFb585t4X3GfJGWclnX4jV6N
 06rgR3Kl+YoF2ayVrFfQdwlDvq1RNNjyX5autILM4IMls7QtHAq402VlQ/Jony6atkgm
 JqbbGmhXJeFm/GeKe1/h2kYdah1OQtuHpTCMwYY1mi1oH6uM6FvR44F1KN1t84iIEoii
 qS+fZenZQytidRyiw39orjKq0bHTcRO4wzFGPT+7Iq5ARczvr0Gy8iIU1HNYqi/FOw0n
 nTB49/CHeBz0h9aaouIcgf0U9pY2s/lrTGaFPbR02uyLaaAVyaS6BBMbEjQYZJRUSpGE
 +1rA==
X-Gm-Message-State: APjAAAWtTt9Mm5CzTtmzstFjsNWUc4q1tcBXIWiRSPUQHEfjR8cE/gRJ
 E1+omCSuUzPLcFOFaiYVqLXpXg==
X-Google-Smtp-Source: APXvYqyL5y7EY84Eu21MFFV49WtPG/KW8qCyZCgGOnMt94q7DHyuNS1E2vIMod0s9a9aCUN/RsATkA==
X-Received: by 2002:ac8:4b6f:: with SMTP id g15mr9940084qts.196.1583014840309; 
 Sat, 29 Feb 2020 14:20:40 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id n8sm7518555qke.37.2020.02.29.14.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 14:20:39 -0800 (PST)
Message-ID: <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason Ekstrand <jason@jlekstrand.net>, Timur =?ISO-8859-1?Q?Krist=F3f?=
 <timur.kristof@gmail.com>
Date: Sat, 29 Feb 2020 17:20:37 -0500
In-Reply-To: <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgc2FtZWRpIDI5IGbDqXZyaWVyIDIwMjAgw6AgMTU6NTQgLTA2MDAsIEphc29uIEVrc3RyYW5k
IGEgw6ljcml0IDoKPiBPbiBTYXQsIEZlYiAyOSwgMjAyMCBhdCAzOjQ3IFBNIFRpbXVyIEtyaXN0
w7NmIDx0aW11ci5rcmlzdG9mQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBTYXQsIDIwMjAtMDIt
MjkgYXQgMTQ6NDYgLTA1MDAsIE5pY29sYXMgRHVmcmVzbmUgd3JvdGU6Cj4gPiA+ID4gMS4gSSB0
aGluayB3ZSBzaG91bGQgY29tcGxldGVseSBkaXNhYmxlIHJ1bm5pbmcgdGhlIENJIG9uIE1ScyB3
aGljaAo+ID4gPiA+IGFyZQo+ID4gPiA+IG1hcmtlZCBXSVAuIFNwZWFraW5nIGZyb20gcGVyc29u
YWwgZXhwZXJpZW5jZSwgSSB1c3VhbGx5IG1ha2UgYSBsb3QKPiA+ID4gPiBvZgo+ID4gPiA+IGNo
YW5nZXMgdG8gbXkgTVJzIGJlZm9yZSB0aGV5IGFyZSBtZXJnZWQsIHNvIGl0IGlzIGEgd2FzdGUg
b2YgQ0kKPiA+ID4gPiByZXNvdXJjZXMuCj4gPiA+IAo+ID4gPiBJbiB0aGUgbWVhbiB0aW1lLCB5
b3UgY2FuIGhlbHAgYnkgdGFraW5nIHRoZSBoYWJpdCB0byB1c2U6Cj4gPiA+IAo+ID4gPiAgIGdp
dCBwdXNoIC1vIGNpLnNraXAKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgYWR2aWNlLCBJIHdhc24n
dCBhd2FyZSBzdWNoIGFuIG9wdGlvbiBleGlzdHMuIERvZXMgdGhpcwo+ID4gYWxzbyB3b3JrIG9u
IHRoZSBtZXNhIGdpdGxhYiBvciBpcyB0aGlzIGEgR1N0cmVhbWVyIG9ubHkgdGhpbmc/Cj4gCj4g
TWVzYSBpcyBhbHJlYWR5IHNldCB1cCBzbyB0aGF0IGl0IG9ubHkgcnVucyBvbiBNUnMgYW5kIGJy
YW5jaGVzIG5hbWVkCj4gY2ktKiAob3IgbWF5YmUgaXQncyBjaS8qOyBJIGNhbid0IHJlbWVtYmVy
KS4KPiAKPiA+IEhvdyBoYXJkIHdvdWxkIGl0IGJlIHRvIG1ha2UgdGhpcyB0aGUgZGVmYXVsdD8K
PiAKPiBJIHN0cm9uZ2x5IHN1Z2dlc3QgbG9va2luZyBhdCBob3cgTWVzYSBkb2VzIGl0IGFuZCBk
b2luZyB0aGF0IGluCj4gR1N0cmVhbWVyIGlmIHlvdSBjYW4uICBJdCBzZWVtcyB0byB3b3JrIHBy
ZXR0eSB3ZWxsIGluIE1lc2EuCgpZb3UgYXJlIHJpZ2h0LCB0aGV5IGFkZGVkIENJX01FUkdFX1JF
UVVFU1RfU09VUkNFX0JSQU5DSF9OQU1FIGluIDExLjYKKHdlIHN0YXJ0ZWQgb3VyIENJIGEgd2hp
bGUgYWdvKS4gQnV0IHRoZXJlIGlzIGV2ZW4gYmV0dGVyIG5vdywgb3UgY2FuCmRvOgoKICBvbmx5
OgogICAgcmVmczoKICAgICAgLSBtZXJnZV9yZXF1ZXN0cwoKVGhhbmtzIGZvciB0aGUgaGludCwg
SSdsbCBzdWdnZXN0IHRoYXQuIEkndmUgbG9va3VwIHNvbWUgb2YgdGhlIGJhY2tlbmQKb2YgbWVz
YSwgSSB0aGluayBpdCdzIHJlYWxseSBuaWNlLCB0aG91Z2ggdGhlcmUgaXMgYSBsb3Qgb2YgY29u
Y2VwdAp0aGF0IHdvbid0IHdvcmsgaW4gYSBtdWx0aS1yZXBvIENJLiBBZ2FpbiwgSSBuZWVkIHRv
IHJlZnJlc2ggb24gd2hhdAp3YXMgbW92ZWQgZnJvbSB0aGUgZW50ZXJwcmlzZSB0byB0aGUgY29t
bXVuaXR5IHZlcnNpb24gaW4gdGhpcyByZWdhcmQsCgo+IAo+IC0tSmFzb24KPiAKPiAKPiA+ID4g
VGhhdCdzIGEgbXVjaCBtb3JlIGRpZmZpY3VsdCBnb2FsIHRoZW4gaXQgbG9va3MgbGlrZS4gTGV0
IGVhY2gKPiA+ID4gcHJvamVjdHMKPiA+ID4gbWFuYWdlIHRoZWlyIENJIGdyYXBoIGFuZCBjb250
ZW50LCBhcyBlYWNoIGNhc2UgaXMgdW5pcXVlLiBSdW5uaW5nCj4gPiA+IG1vcmUKPiA+ID4gdGVz
dHMsIG9yIGJ1aWxkaW5nIG1vcmUgY29kZSBpc24ndCB0aGUgbWFpbiBpc3N1ZSBhcyB0aGUgQ1BV
IHRpbWUgaXMKPiA+ID4gbW9zdGx5IHNwb25zb3JlZC4gVGhlIGRhdGEgdHJhbnNmZXJzIGJldHdl
ZW4gdGhlIGNsb3VkIG9mIGdpdGxhYiBhbmQKPiA+ID4gdGhlIHJ1bm5lcnMgKHdoaWNoIGFyZSBl
eHRlcm5hbCksIGFsb25nIHRvIHNlbmRpbmcgT1MgaW1hZ2UgdG8gTGF2YQo+ID4gPiBsYWJzIGlz
IHdoYXQgaXMgbGlrZWx5IHRoZSBtb3N0IGV4cGVuc2l2ZS4KPiA+ID4gCj4gPiA+IEFzIGl0IHdh
cyBhbHJlYWR5IG1lbnRpb24gaW4gdGhlIHRocmVhZCwgd2hhdCB3ZSBhcmUgbWlzc2luZyBub3cs
IGFuZAo+ID4gPiBiZWluZyB3b3JrZWQgb24sIGlzIHBlciBncm91cC9wcm9qZWN0IHN0YXRpc3Rp
Y3MgdGhhdCBnaXZlIHVzIHRoZQo+ID4gPiBob3RzcG90IHNvIHdlIGNhbiBiZXR0ZXIgdGFyZ2V0
IHRoZSBvcHRpbWl6YXRpb24gd29yay4KPiA+IAo+ID4gWWVzLCB3b3VsZCBiZSBuaWNlIHRvIGtu
b3cgd2hhdCB0aGUgaG90c3BvdCBpcywgaW5kZWVkLgo+ID4gCj4gPiBBcyBmYXIgYXMgSSB1bmRl
cnN0YW5kLCB0aGUgcHJvYmxlbSBpcyBub3QgQ0kgaXRzZWxmLCBidXQgdGhlIGJhbmR3aWR0aAo+
ID4gbmVlZGVkIGJ5IHRoZSBidWlsZCBhcnRpZmFjdHMsIHJpZ2h0PyBXb3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBub3QgaG9zdAo+ID4gdGhlIGJ1aWxkIGFydGlmYWN0cyBvbiB0aGUgZ2l0bGFiLCBi
dXQgcmF0aGVyIG9ubHkgdGhlIHBsYWNlIHdoZXJlIHRoZQo+ID4gYnVpbGQgYWN0dWFsbHkgaGFw
cGVuZWQ/IE9yIGF0IGxlYXN0LCBvbmx5IHRyYW5zZmVyIHRoZSBidWlsZCBhcnRpZmFjdHMKPiA+
IG9uLWRlbWFuZD8KPiA+IAo+ID4gSSdtIG5vdCBleGFjdGx5IGZhbWlsaWFyIHdpdGggaG93IHRo
ZSBzeXN0ZW0gd29ya3MsIHNvIHNvcnJ5IGlmIHRoaXMgaXMKPiA+IGEgc2lsbHkgcXVlc3Rpb24u
Cj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBtZXNhLWRldiBtYWlsaW5nIGxpc3QKPiA+IG1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9t
ZXNhLWRldgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
