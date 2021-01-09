Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD222EFCC8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 02:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13E76E8F7;
	Sat,  9 Jan 2021 01:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335EE6E8F7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 01:43:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD149DA;
 Sat,  9 Jan 2021 02:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610156610;
 bh=wqpTJfWKmXk28sF8lXgZrIz4pOxQeeVyON96S0WUVWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AsVi3+ZSqTV8lRje1dhVOvNv43AqQ+uNaBUIdDWhPFk9zOz7W7bIlRfihuFU7ORWj
 foq7PUaoRnXkX2FnI5hunmhkDWRZsOOtuU7SKtUJv2Q38e/Sisn8CrROK7QyIOkSV6
 CepR++hYAfjMr0w7V2q96WJjE7zJjMNkulIyiAnk=
Date: Sat, 9 Jan 2021 03:43:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
Message-ID: <X/kKNXdX6uXBQuFw@pendragon.ideasonboard.com>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-2-laurent.pinchart+renesas@ideasonboard.com>
 <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
 <20200622092933.GY20149@phenom.ffwll.local>
 <20200717022716.GA1845@pendragon.ideasonboard.com>
 <843d7b34-418d-991b-d1d9-0ad5089d20a4@amd.com>
 <X9ltvZIEHjiYoLVp@pendragon.ideasonboard.com>
 <MN2PR12MB4488A356AC7AF9FD844F0F89F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
 <X9ooRDIL3vu6VfRS@kroah.com>
 <CADnq5_Ngd6A4-RMvXX7oofLLayK9YBm1+7-GakDrjtoBtnXW2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Ngd6A4-RMvXX7oofLLayK9YBm1+7-GakDrjtoBtnXW2w@mail.gmail.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCk9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDEwOjAxOjAwQU0gLTA1MDAsIEFsZXgg
RGV1Y2hlciB3cm90ZToKPiBPbiBXZWQsIERlYyAxNiwgMjAyMCBhdCAxMDozMCBBTSBHcmVnIEty
b2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAxNiwgMjAyMCBhdCAwMjo1MjoyNVBN
ICswMDAwLCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4gPiA+IFtBTUQgUHVibGljIFVzZV0K
PiA+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+ID4g
PiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMCA5OjE1IFBNCj4gPiA+ID4gVG86IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4gPiA+ID4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IExhdXJlbnQgUGluY2hhcnQKPiA+ID4gPiA8
bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+OyBkcmktCj4gPiA+ID4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+OyBHcmVnIEtyb2FoLQo+ID4gPiA+IEhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPjsgVGhvbWFzIEdsZWl4bmVyCj4gPiA+ID4gPHRnbHhAbGludXRyb25peC5kZT47IERldWNo
ZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47Cj4gPiA+ID4gUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPjsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+OyBC
ZW4KPiA+ID4gPiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT47IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPjsKPiA+ID4gPiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPjsgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD47Cj4gPiA+ID4gVk13YXJl
IEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+OyBUaG9tYXMK
PiA+ID4gPiBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiA+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvM10gZHJtOiB1YXBpOiBVc2UgU1BEWCBpbiBEUk0gZHJpdmVycyB1QVBJ
IGhlYWRlcnMKPiA+ID4gPgo+ID4gPiA+IEhpIENocmlzdGlhbiwKPiA+ID4gPgo+ID4gPiA+IE9u
IEZyaSwgSnVsIDE3LCAyMDIwIGF0IDA0OjA1OjQyUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4gPiA+ID4gPiBBbSAxNy4wNy4yMCB1bSAwNDoyNyBzY2hyaWViIExhdXJlbnQgUGlu
Y2hhcnQ6Cj4gPiA+ID4gPiA+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDExOjI5OjMzQU0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiA+PiBPbiBNb24sIEp1biAyMiwgMjAy
MCBhdCAwOTo1ODo0NEFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+ID4g
Pj4+IEFtIDIxLjA2LjIwIHVtIDA0OjA3IHNjaHJpZWIgTGF1cmVudCBQaW5jaGFydDoKPiA+ID4g
PiA+ID4+Pj4gTW9zdCBvZiB0aGUgRFJNIGRyaXZlcnMgdUFQSSBoZWFkZXJzIGFyZSBsaWNlbnNl
ZCB1bmRlciB0aGUgTUlUCj4gPiA+ID4gPiA+Pj4+IGxpY2Vuc2UsIGFuZCBjYXJyeSBjb3BpZXMg
b2YgdGhlIGxpY2Vuc2Ugd2l0aCBzbGlnaHQgdmFyaWF0aW9ucy4KPiA+ID4gPiA+ID4+Pj4gUmVw
bGFjZSB0aGVtIHdpdGggU1BEWCBoZWFkZXJzLgo+ID4gPiA+ID4gPj4+IE15IHBlcnNvbmFsIG9w
aW5pb24gaXMgdGhhdCB0aGlzIGlzIGEgcmVhbGx5IGdvb2QgaWRlYSwgYnV0IG15Cj4gPiA+ID4g
PiA+Pj4gcHJvZmVzc2lvbmFsIGlzIHRoYXQgd2UgbmVlZCB0aGUgYWNrbm93bGVkZ21lbnQgZnJv
bSBvdXIgbGVnYWwKPiA+ID4gPiBkZXBhcnRtZW50IGZvciB0aGlzLgo+ID4gPiA+ID4gPj4gSSB0
aGluayBvZmZpY2lhbCBhY2sgZnJvbSBhbWQgb24gZmlyc3QgcGF0Y2gsIGVzcGVjaWFsbHkgdGhl
IC5yc3QKPiA+ID4gPiA+ID4+IHNuaXBwZXQsIHdvdWxkIGJlIHJlYWxseSBnb29kIGluZGVlZC4K
PiA+ID4gPiA+ID4gQW55IHVwZGF0ZSBvbiB0aGlzIG9uZSA/Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
U29ycnkgdG90YWxseSBmb3Jnb3QgdG8gZm9yd2FyZCB0aGlzIGJlY2F1c2UgSSB3YXMgd2FpdGlu
ZyBmb3Igc3BsaXQKPiA+ID4gPiA+IHVwIHBhdGNoZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gR29p
bmcgdG8gZG8gc28gcmlnaHQgbm93Lgo+ID4gPiA+Cj4gPiA+ID4gSGFzIHRoZXJlIGJlZW4gYW55
IHVwZGF0ZSA/IDotKQo+ID4gPgo+ID4gPiBBTUQgbGVnYWwgcmVxdWlyZXMgdGhlIGZ1bGwgbGlj
ZW5zZS4KPiA+Cj4gPiBVbSwgd2hhdD8gIFBsZWFzZSBsZXQgbWUgdGFsayB0byB0aGVtIGFib3V0
IHRoaXMsIGl0J3Mgbm90IG9rIGZvciBvbmUKPiA+IGluZGl2aWR1YWwgY29tcGFueSwgb3V0IG9m
IDQ1MCssIHRvIHNvbWVob3cgZGVjaWRlIHRvIGRvIHNvbWV0aGluZwo+ID4gZGlmZmVyZW50Lgo+
ID4KPiA+IFBsZWFzZSBwdXQgeW91ciBsYXd5ZXJzIGluIGNvbnRhY3Qgd2l0aCBtZSBhbmQgSSB3
aWxsIGhhdmUgdGhlbSBkaXNjdXNzCj4gPiBpdCB3aXRoIHRoZSBwcm9wZXIgbGF3eWVycyBvbiBv
dXIgc2lkZS4KPiAKPiBBZnRlciBtb3JlIGRpc2N1c3Npb24sIHRoZSBsYXd5ZXJzIGhhdmUgYWxs
b3dlZCB1cyB0byB1c2UgdGhlIFNQRFggbGljZW5zZXMgbm93LgoKVmVyeSBuaWNlIHRvIGhlYXIg
dGhpcywgdGhhbmsgeW91IDotKQoKQ291bGQgeW91IHJlcGx5IHRvIHRoZSBjb3JyZXNwb25kaW5n
IHBhdGNoZXMgaW4gdjIgd2l0aCBhbiBBY2tlZC1ieSA/CgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
