Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CAD35855
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8C895E1;
	Wed,  5 Jun 2019 08:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665A895D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B861AFB03;
 Wed,  5 Jun 2019 10:13:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ztGu3CIdt5D; Wed,  5 Jun 2019 10:13:26 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 05F3F49A26; Wed,  5 Jun 2019 10:13:25 +0200 (CEST)
Date: Wed, 5 Jun 2019 10:13:25 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Message-ID: <20190605081325.GA11331@bogon.m.sigxcpu.org>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de>
 <20190528013800.GB6885@dragon>
 <20190528070353.GA14871@fsr-ub1664-121>
 <20190528093300.GA5118@bogon.m.sigxcpu.org>
 <20190528101010.GB15992@fsr-ub1664-121>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528101010.GB15992@fsr-ub1664-121>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDEwOjEwOjExQU0gKzAwMDAsIExhdXJlbnRpdSBQ
YWxjdSB3cm90ZToKPiBIaSBHdWlkbywKPiAKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAxMToz
MzowMEFNICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+IENhdXRpb246IEVYVCBFbWFp
bAo+ID4gCj4gPiBIaSBMYXVyZW50aXUsCj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNzow
Mzo1NEFNICswMDAwLCBMYXVyZW50aXUgUGFsY3Ugd3JvdGU6Cj4gPiA+IEhpIFNoYXduLCBMdWNh
cywKPiA+ID4KPiA+ID4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDk6Mzg6MDJBTSArMDgwMCwg
U2hhd24gR3VvIHdyb3RlOgo+ID4gPiA+IENhdXRpb246IEVYVCBFbWFpbAo+ID4gPiA+Cj4gPiA+
ID4gSGkgTHVjYXMsCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwMzoz
Njo1M1BNICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiA+ID4gPiA+IFdlIGhhdmUgYmVlbiBs
b29raW5nIGF0IGhvdyB0byBzdXBwb3J0IERDU1MgaW4gbWFpbmxpbmUgZm9yIGEgd2hpbGUsCj4g
PiA+ID4gPiBidXQgbW9zdCBvZiB0aGUgYWN0dWFsIHdvcmsgZ290IHB1c2hlZCBiZWhpbmQgaW4g
c2NoZWR1bGUgZHVlIHRvIG90aGVyCj4gPiA+ID4gPiBwcmlvcml0aWVzLgo+ID4gPiA+Cj4gPiA+
ID4gSSBoYXZlIHNvbWUgdGltZSB0byBjb250cmlidXRlLiAgV291bGQgeW91IHN1Z2dlc3QgaG93
IEkgc2hvdWxkIGhlbHAKPiA+ID4gPiBoZXJlPwo+ID4gPiA+Cj4gPiA+ID4gMS4gWW91IGd1eXMg
YWxyZWFkeSBoYXZlIHNvbWV0aGluZyBjbG9zZSB0byBjb21wbGV0aW9uIGFuZCBkbyBub3QgbmVl
ZAo+ID4gPiA+ICAgIG1vcmUgaGFuZHMuCj4gPiA+ID4gMi4gWW91IGd1eXMgYWxyZWFkeSBoYXZl
IHNvbWUgcHJlbGltaW5hcnkgY29kZSBhbmQgY2FuIHVzZSBoZWxwIGZyb20KPiA+ID4gPiAgICBv
dGhlcnMuCj4gPiA+ID4gMy4gWW91IGd1eXMgaGF2ZW4ndCBnb3QgYW55dGhpbmcgdG8gc3RhcnQg
d2l0aCwgYnV0IGp1c3Qgc29tZSBkZXNpZ24KPiA+ID4gPiAgICBwcmluY2lwbGVzIHRoYXQgYW55
b25lIHdobyB3YW50cyB0byB3b3JrIG9uIGl0IHNob3VsZCBjb25zaWRlci4KPiA+ID4gPgo+ID4g
PiA+IFdoaWNoIGlzIHRoZSBvbmUgdGhhdCB5b3Ugd2FudCBtZSB0byByZWFkPwo+ID4gPgo+ID4g
PiBXZSdyZSBhbHJlYWR5IHdvcmtpbmcgb24gY2xlYXJpbmcgdXAgdGhlIERDU1MgY29kZSBhbmQg
cHJlcGFyaW5nIGl0IGZvcgo+ID4gPiB1cHN0cmVhbWluZy4gSXQgc2hvdWxkIGJlIGRvbmUgaW4g
dGhlIGZvbGxvd2luZyB3ZWVrcy4gVGhlIHJlYXNvbiB3ZSd2ZQo+ID4gPiBiZWVuIGRlbGF5aW5n
IHRoaXMgaXMgYmVjYXVzZSBuZWl0aGVyIEhETUkgbm9yIE1JUEkgc3VwcG9ydCB3YXMgcHJlc2Vu
dAo+ID4gPiBhbmQsIHVudGlsIHRoZXNlIGFyZSB1cHN0cmVhbSwgdGVzdGluZyBEQ1NTIHdvdWxk
IGJlIHF1aXRlIGltcG9zc2libGUuCj4gPiAKPiA+IE1JUEkgc3VwcG9ydCBpcyBoZXJlOgo+ID4g
Cj4gPiAgIG1peGVsOiAgaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZyUyRnNlcmll
cyUyRjU4ODE3JTJGJmFtcDtkYXRhPTAyJTdDMDElN0NsYXVyZW50aXUucGFsY3UlNDBueHAuY29t
JTdDOTkyNGM0NjI4ZDVmNGY5OGQ4YTgwOGQ2ZTM0ZjdiMjYlN0M2ODZlYTFkM2JjMmI0YzZmYTky
Y2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM2OTQ2MzI3ODM5ODI4MzY2JmFtcDtzZGF0YT1WWnZ2
aGUyV2tNVkNTT0V3NW9aREpmeTdyc3FGN1lhRWlycmtMRkM4SWN3JTNEJmFtcDtyZXNlcnZlZD0w
Cj4gPiAgIG53bDogIGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRnBhdGNod29yay5mcmVlZGVza3RvcC5vcmclMkZzZXJpZXMl
MkY1NzY4NiUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDbGF1cmVudGl1LnBhbGN1JTQwbnhwLmNvbSU3
Qzk5MjRjNDYyOGQ1ZjRmOThkOGE4MDhkNmUzNGY3YjI2JTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNk
OTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNjk0NjMyNzgzOTgzODM1OSZhbXA7c2RhdGE9UTRzNk9a
cTFLRWxrdGpTWFJkMmxLQk1kZzF5UEpzV0dtOFVyU1BxcVRpRSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+
ID4gCj4gPiBUaGUgTldMIGRyaXZlciBuZWVkcyB0byBiZSBhZGp1c3RlZCBkZXBlbmRpbmcgb24g
d2hldGhlciB3ZSBob29rIGludG8KPiA+IGlteC1kaXNwbGF5LXN1YnN5c3RlbSBvciBub3QgKGFu
ZCB0aGVuIGxpa2VseSBtb3ZlZCB0byB0aGUgcmlnaHQKPiA+IHN1YmRpcikuIENhbiB3ZSBzb21l
aG93IGdldCB0aGlzIG1vdmluZyBpbiBzeW5jIChldmVuIGluIGEgbm9uIHB1YmxpYwo+ID4gdHJl
ZSBpZiBuZWNlc3NhcnkpLgo+IAo+IEkgZ3Vlc3Mgd2UgY291bGQgZG8gdGhhdCBhcyB3ZWxsLiBJ
J2xsIHN0YXJ0IGFkanVzdGluZyB0aGUgZHJpdmVyIGFuZAo+IHRha2UgaXQgb3V0IG9mIGlteC1k
cm0sIGFzIHN1Z2dlc3RlZCBieSBMdWNhcyBhbmQgRGFuaWVsLiBJJ2xsIHVzZSB5b3VyCj4gTUlQ
SSBwYXRjaGVzIHRvIHRlc3Qgd2l0aC4KCkNvb2wuIHRoaXMgd2lsbCBsaWtlbHkgbWVhbiB0dXJu
aW5nIHRoZSBOV0wgcGFydCBpbnRvIGEgYnJpZGdlIHdoaWNoIEkKY2FuIGxvb2sgaW50by4gV2Ug
d2FudCB0aGF0IHdoZW4gaW50ZXJmYWNpbmcgd2l0aCBteHNmYiBhbnl3YXkuCkNoZWVycywKIC0t
IEd1aWRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
