Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B6D57CDA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4BD6E5CD;
	Thu, 27 Jun 2019 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574586E423
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:08:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45YjyL6npYz1rM6G;
 Wed, 26 Jun 2019 15:08:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45YjyL5PsLz24pPF;
 Wed, 26 Jun 2019 15:08:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id mW40lDtlRKyk; Wed, 26 Jun 2019 15:08:25 +0200 (CEST)
X-Auth-Info: M7TO+r04jND4OVh0jwW0qPP/gNmvYvfVkP026FBjY4U=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 26 Jun 2019 15:08:25 +0200 (CEST)
Subject: Re: [PATCH] dt-bindings: display: Add ETM0700G0DH6 compatible string
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190529102540.4608-1-marex@denx.de>
 <3798152a-59a8-59e0-e733-1ca900c4d8a4@denx.de>
 <20190626124821.GA23428@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 mQINBFHmnxgBEACuQOC6Kaw/32MTeUJdFuDZ1FrbG76a0Ys/I02Kj9jXDmCCLvqq18Z4A1b0
 xbuMKGDy5WR77fqGV8zADUo6i1ATgCZeg+SRmQROF8r9K6n6digTznBySSLANhN3kXUMNRE1
 WEIBGCZJ5FF+Qq59AkAUTB8CiIzfEW98o7lUjeEume/78wR18+QW+2z6eYli2qNECceRINXT
 zS3oxRMr+ivqEUGKvMBC/WNLuvJoCGsfSQc2I+uGEU7MOdOCC6SsKdnPBGKYth5Ieb16bRS1
 b9M5BoEKTEzDCOWn92OxeHX6M2gLEMQobfM0RdIowMfWaUHdci2cLUTyL0T/P/gIpHMR2LhL
 8sdbNZufgv73s9PDgxTWMzypXimMJ7VZmVh9I2nQd2xm8+uE1rghqb90aEMFCTwUlrz4Qhjh
 vmczd2ScuuOMLzHEaaoOrMGbaWIEFcJvQgyHzJgMPgnG64eDq6uGyBEXRc3bBzv7B765Hcg8
 SSNqoUstjuQQlGp3y3Yj16l+PyZ3Ucy2swFYLVPTc35xFBk/uGEIhGncoFpOX29rxt9M8r5G
 hm7395m0GmDy50H/HN61/S8EPvM3HUjqBvX1EqU+vJXfwozxkKpIwcjx7h3W+PPS9TUb7r5v
 vHCqnrWRd/m6KWbCJsv0rsIU66o2qKYX5cIHV6u6Y7Zm7BtHfwARAQABtBtNYXJlayBWYXN1
 dCA8bWFyZXhAZGVueC5kZT6JAjgEEwECACIFAlHmnxgCGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAAAoJEOtsLUEh5B0XLk0QAINOYFYB3v4KjXSFHYBQLlDblqhXvVtjyQHMiJsY1BMO
 mMrANUJQtpY3UkYquFspe2GBiFQbfW+mDlwFlSNpzaJ68qGEK+57I/MufsZKV6Ze9j7QeClu
 orYH+zfIBI7sn0HkY/MWN/Z270gRv2xSxDBP/8SPdB53EkImLZUFOo4/5eyuQ4t8HLgol02u
 2ncwXrnT036QC3SiNJDCJhwkpjvamPHghxr8hbIwkdOLZlYWfl0yzYzQohl8zBEwtBxl5cS4
 1TcrgBXsanQUMVNBpl0s8nQLKuHJNPOAhBnKstAe54yY3iWswYayHqqgqIQldcDqttHhdTJW
 mb9hTSf5p6fnZqcsfi3PUFwj5PJSN3aAbF8w42FwRvIOWbksFIWXpxYI3mq2TmX4GtlKdlF8
 xT+Q+Cbk538IBV4OQ5BapuYHs1C1ff9gVC0rfrCEloyteHafHwOv3ZuEGPlH89Rl4EjRvJxX
 8nE0sCiq6yUbpom8xRA5nFwA0bbTDwhH5RD/952bZraLpWcdJ6cWA2gefd2+2fy0268xyHmD
 m87B49BIaAsZ2kvEb/scCZ/CvPHjHLAjr+/GsdzOxwB68P41ZajujMDmbka00CyeAl88pgLX
 tTkPvAzuEDpRoJmg8zrQqrsmEKSdhFJhZ7d2MMKpCcVnInByXjM+1GEfSisTgWnluQINBFHm
 nxgBEAC8MpoO1s1AB0uRQGXlhYzkYvxkDGAe50/18ct2K6ORSv7HjCmZBjJX+2xTPSmML9ju
 3P0KrlnRdT8qCh+ozijffLjm5X9Fk+6mGQ56UQzivuPNlgyC3epF3Z58VPVQcIfE2/pdAxtZ
 zKc4P5t2yo5qk635huo0NvNg5mRhvfZ7mZpZuBahkHguR0Heh/tnGCa2v5P6uFbGX8+6rAA8
 EKxl5Tclf27PFZwbIWL1buS9RwgzsHj2TFnnEFIcWdMHyGy2GT8JMgY0VwxKebzGJg2RqfOL
 PaPjnvnXHAIYEknQp0TUtUiNxm0PBa4IQ30XhrB9D5QYdcw/DVvCzb9qyIlaQKEqHZm1fGU4
 iCsH3jV+5D4Lrn5JfXc/+A1NsLUq/NFIYhphbX4fGjR2QdZJrDnGVcxSlwP7CeRuxGELrASz
 m4G4Q0mYz7HdAlzBJHi8Ej4yC9l7PPlnxdUcAwheLxGwzMCf5vxw1C6Zi8PvKu/sY7Bha9XJ
 plvuLBi7QrkD8mZEzt+xC9nWRt7hL47+UvyduFe4qDMTPrW20ROxCykC36gj53YhqqLblioX
 2//vGLKj8x+LiLSTwjkLkrwOremhdTqr457511vOXyaZyOlWhFjN+4j9xwbbg1IWwMenRAb7
 Qwuipck6fN2o+PK9i6t6pWXrUDNI/VCMbimnuqPwAQARAQABiQIfBBgBAgAJBQJR5p8YAhsM
 AAoJEOtsLUEh5B0XMqAP/1HbrClefDZ/Lvvo89mgC56vWzEstmFo8EihqxVZvpkiCjJoCH53
 VCYeGl41p0y6K5gaLT28s9waVHBw+dhpwABba3neV/vyXv0wUtvkS3T0e4zruYFWw0lQoZi+
 8rtXTsuWN5t3u8avXsrdqD0CteTJdgZ7yBV8bBvK2ekqFMS/cLC+MoYlmUFn6Tcxmv0x8QZY
 ux6ts9YpUvx8QxMJt9vfwt1WIUEFKR3JQdrZmbPGqWJ3s+u/C+v9stC5qf2eYafRjzy05lEn
 B06W5D5Uc+FGEhuzq4G0eRLgivMoC0Eqz7HuwGcRAJYQILQ3Vzd4oHKPoUAtvlKqUwDmHodT
 HPmN73JMsvO3jLrSdl4k6o3CdlS/DI0Eto4fD0Wqh6d5q11u1TOM7+/LehWrOOoGVqRc6FFT
 ofck6h6rN/Urwkr1nWQ3kgO1cd/gevqy8Tevo/qkPYIf71BlypcXhKqn6IPjkq4QLiDPRjHM
 tgPc2T/X/ETe5eCuhxMytIYbt1fK2pDXPoIKbbDK4uEmg9USXZ+pYrac4PFo1d+6D6vmTjRZ
 GRRITOVpKgBndfPyqofxeKNKGdNf9FS/x89RlnDWXsQHm+0pXguSRG9XdB16ZFNgeo8SeZVr
 qc9uLfhyQp/zB6qEnuX1TToug7PuDgcNZdjN3vgTXyno2TFMxp/LKHqg
Message-ID: <1e90005f-e329-6479-6307-2ae9b3f7f59f@denx.de>
Date: Wed, 26 Jun 2019 15:08:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190626124821.GA23428@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Jan Tuerk <jan.tuerk@emtrion.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNi8xOSAyOjQ4IFBNLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gSGkgTWFyZWsuCj4gCj4g
T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTI6NDM6NDlBTSArMDIwMCwgTWFyZWsgVmFzdXQgd3Jv
dGU6Cj4+IE9uIDUvMjkvMTkgMTI6MjUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gVGhlIEVU
TTA3MDBHMERINiBpcyBjdXJyZW50bHkgZG9jdW1lbnRlZCBhcyB1c2luZyBlZHQsZXRtMDcwMDgw
ZGg2Cj4+PiBjb21wYXRpYmxlIHN0cmluZywgaG93ZXZlciB0aGUgTGludXgga2VybmVsIGRyaXZl
ciBhcyB3ZWxsIGFzIGEKPj4+IGNvdXBsZSBvZiBEVHMgdXNlIGVkdCxldG0wNzAwZzBkaDYgY29t
cGF0aWJsZSBzdHJpbmcuIEFkZCBpdCBpbnRvCj4+PiB0aGUgZG9jdW1lbnRhdGlvbi4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IENjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+Pj4gQ2M6IEphbiBUdWVyayA8amFuLnR1ZXJr
QGVtdHJpb24uY29tPgo+Pj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Cj4+PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IFRvOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+PiAtLS0KPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2VkdCxldC1zZXJpZXMudHh0ICAgICAgICAgfCAyICstCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2VkdCxl
dC1zZXJpZXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZWR0LGV0LXNlcmllcy50eHQKPj4+IGluZGV4IGJlODY4NDMyN2VlNC4uYjdhYzFjNzI1
Zjk3IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2VkdCxldC1zZXJpZXMudHh0Cj4+PiBAQCAt
NDAsNyArNDAsNyBAQCBzaW1wbGUtcGFuZWwudHh0Cj4+PiAgfCBJZGVudGlmaWVyICAgICAgfCBj
b21wYXRiaWxlICAgICAgICAgIHwgZGVzY3JpcHRpb24gICAgICAgICAgICAgICAgICAgICAgICAg
fAo+Pj4gICs9PT09PT09PT09PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT0rPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsKPj4+ICB8IEVUTTA3MDBHMERINiAgICB8IGVk
dCxldG0wNzAwODBkaDYgICAgfCBXVkdBIFRGVCBEaXNwbGF5IHdpdGggY2FwYWNpdGl2ZSAgICB8
Cj4+PiAtfCAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwgVG91Y2hzY3Jl
ZW4gICAgICAgICAgICAgICAgICAgICAgICAgfAo+Pj4gK3wgICAgICAgICAgICAgICAgIHwgZWR0
LGV0bTA3MDBnMGRoNiAgICB8IFRvdWNoc2NyZWVuICAgICAgICAgICAgICAgICAgICAgICAgIHwK
Pj4+ICArLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4+PiAgfCBFVE0wNzAwRzBCREg2ICAgfCBlZHQs
ZXRtMDcwMDgwYmRoNiAgIHwgU2FtZSBhcyBFVE0wNzAwRzBESDYgYnV0IHdpdGggICAgICAgfAo+
Pj4gIHwgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICB8IGludmVydGVkIHBp
eGVsIGNsb2NrLiAgICAgICAgICAgICAgIHwKPj4+Cj4+Cj4+IEJ1bXAgPwo+IEFzIEkgZ290IE9L
IG9uIGlyeCB0byBhcHBseSB0cml2aWFsIGR0LWJpbmRpbmdzIHBhdGNoZXMgZm9yIHBhbmxlcyBJ
Cj4gaGF2ZSBub3cgdGFrZW4gY2FyZSBvZiB0aGlzIG9uZS4KPiBBcHBsaWVkIHRvIGRybS1taXNj
LW5leHQgYW5kIHdpbGwgcHVzaCBpdCBvdXQgc29vbi4KClRoYW5rcwoKLS0gCkJlc3QgcmVnYXJk
cywKTWFyZWsgVmFzdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
