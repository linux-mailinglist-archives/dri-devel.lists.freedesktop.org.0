Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E38392B4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 19:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C9B892DC;
	Fri,  7 Jun 2019 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB1892DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 17:02:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 10:02:07 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 07 Jun 2019 10:02:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2019 20:02:04 +0300
Date: Fri, 7 Jun 2019 20:02:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Ser, Simon" <simon.ser@intel.com>
Subject: Re: Linking ALSA playback devices and DRM connectors
Message-ID: <20190607170204.GA5942@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nicholas.Kazlauskas@amd.com" <Nicholas.Kazlauskas@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDk6MTM6NTFBTSArMDAwMCwgU2VyLCBTaW1vbiB3cm90
ZToKPiBPbiBUdWUsIDIwMTktMDYtMDQgYXQgMTc6MTUgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4gPiBBbSAwNC4wNi4xOSB1bSAxNzowNSBzY2hyaWViIFNlciwgU2ltb246Cj4gPiA+
IEhpLAo+ID4gPiAKPiA+ID4gSSdtIHRyeWluZyB0byBsaW5rIEFMU0EgcGxheWJhY2sgZGV2aWNl
cyBhbmQgRFJNIGNvbm5lY3RvcnMuIEluIG90aGVyCj4gPiA+IHdvcmRzLCBJJ2QgbGlrZSB0byBi
ZSBhYmxlIHRvIGtub3cgd2hpY2ggQUxTQSBkZXZpY2UgSSBzaG91bGQgb3BlbiB0bwo+ID4gPiBw
bGF5IGF1ZGlvIG9uIGEgZ2l2ZW4gY29ubmVjdG9yLgo+ID4gPiAKPiA+ID4gVW5mb3J0dW5hdGVs
eSwgSSBoYXZlbid0IGZvdW5kIGEgd2F5IHRvIGV4dHJhY3QgdGhpcyBpbmZvcm1hdGlvbi4gSQo+
ID4gPiBrbm93IC9wcm9jL2Fzb3VuZC9jYXJkTi9lbGQqIGV4cG9zZSB0aGUgRURJRC1saWtlIGRh
dGEuIEhvd2V2ZXIgYnkKPiA+ID4gbG9va2luZyBhdCB0aGUgQUxTQSBBUEkgKGFsc286IGFwbGF5
IC1sIGFuZCAtTCkgSSBjYW4ndCBmaW5kIGEgd2F5IHRvCj4gPiA+IGZpZ3VyZSBvdXQgd2hpY2gg
UENNIGRldmljZSBtYXBzIHRvIHRoZSBFTEQuCj4gPiA+IAo+ID4gPiBBbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPwo+ID4gCj4gPiBJcyB0aGF0IGFjdHVhbGx5IGZpeGVkIG9uIGFsbCBoYXJkd2FyZT8g
T3IgZG8gd2UgbWF5YmUgaGF2ZSBzb21lIAo+ID4gaGFyZHdhcmUgd2l0aCBvbmx5IG9uZSBhdWRp
byBjb2RlYyBhbmQgbXVsdGlwbGUgY29ubmVjdG9ycz8KPiA+IAo+ID4gPiBJZiBub3QsIHdoYXQg
d291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGV4cG9zZSB0aGlzPwo+ID4gPiAKPiA+ID4gLSBBIHN5
bWxpbmsgdG8gdGhlIEFMU0EgYXVkaW8gUENNIGRldmljZSBpbgo+ID4gPiAgICAvc3lzL2NsYXNz
L2RybS9jYXJkTi1DT05ORUNUT1I/Cj4gPiA+IC0gQSBzeW1saW5rIHRvIHRoZSBEUk0gY29ubmVj
dG9yIGluIC9zeXMvY2xhc3Mvc291bmQvcGNtKj8KPiA+IAo+ID4gSWYgaXQncyBmaXhlZCB0aGFu
IHRob3NlIHR3byBvcHRpb25zIHNvdW5kIHNhbmUgdG8gbWUuCj4gPiAKPiA+ID4gLSBBIERSTSBj
b25uZWN0b3IgcHJvcGVydHk/Cj4gPiAKPiA+IElmIGl0J3MgY29uZmlndXJhYmxlIHRoYW4gdGhh
dCBzb3VuZHMgbGlrZSBhIGdvb2Qgb3B0aW9uIHRvIG1lLgo+IAo+IEknbSBzdGlsbCBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgaXMgZml4ZWQgb24gYWxsIGhhcmR3YXJlIG9yIG5vdC4KPiAKPiBWaWxs
ZSwgb24gdGhpcyBvbGQgSW50ZWwgaHcsIGlzIHRoZSBzaW5nbGUgY29ubmVjdG9yIHRoYXQgZ2V0
cyB0aGUKPiBhdWRpbyBjb25maWd1cmFibGU/CgpUaGUgZm9yY2UtYXVkaW8gcHJvcGVydHkgY2Fu
IGJlIHVzZWQgZm9yIHRoYXQuIFRoYXQgaXMsIHlvdSBjYW4gZm9yY2UKYXVkaW8gb2ZmIGZvciBh
bGwgdGhlIGNvbm5lY3RvciB3aGVyZSB5b3UgZG9uJ3Qgd2FudCBhdWRpbyBhbmQgdGhlbgppdCBz
aG91bGQgZ2V0IGF1dG9tYWdpY2FsbHkgcm91dGVkIHRvIHRoZSByZW1haW5pbmcgY29ubmVjdG9y
LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
