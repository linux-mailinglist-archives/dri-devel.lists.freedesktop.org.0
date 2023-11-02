Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7677DF9AC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 19:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9734210E5F0;
	Thu,  2 Nov 2023 18:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A61910E96A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 18:00:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SLs9S5WDgz9sQv;
 Thu,  2 Nov 2023 19:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=MBO0001; t=1698948029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQq4M4XAb8Wj0/P1H+vReK8gvikH2R+gRwxOmOIRtvs=;
 b=M74p3JmWm9YR5+pq1pYRVEqjqhSx3N076S3faW7YvXlhljkckcXnpI+sPJD1Iy/XDuAOg/
 b16Dmz8JkLdPC5taj+eqmzTa2s+A69g14sxQ28ppzmC3Satabs/jHYAqTjSIwW90kqNhg8
 PziosFirP+yXjoORZErx8F829PQbxP9NF13VwlnP0aENljWagpPAkNiR8aoFnTHuhdV9v4
 SF/9DcgarO9yKW65iFloTiEOFb7smU/2Kki5YhdSKdZqC/rHRFy/vlf+aIMAat5sDpvcRT
 cMktMC4aLprDpyjY5oQWgBbN7m3x3S+i9EQ5Q8rSd83dI5OoYH+pOr3i4WwRlw==
Date: Thu, 2 Nov 2023 11:00:23 -0700
Message-ID: <20231102110023.GH14639@craftyguy.net>
From: Clayton Craft <clayton@craftyguy.net>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH] drm/panel-edp: Add timings for BOE NV133WUM-N63
In-Reply-To: <631454b9-9f50-4cad-a58e-b9ea9dead421@quicinc.com>
References: <20231028021910.24031-1-clayton@craftyguy.net>
 <631454b9-9f50-4cad-a58e-b9ea9dead421@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="4gQ4uxxJyh1jXvVV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4SLs9S5WDgz9sQv
X-Mailman-Approved-At: Thu, 02 Nov 2023 18:12:33 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4gQ4uxxJyh1jXvVV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAzMCBPY3QgMjAyMyAxMzo1ODozMSAtMDcwMCBKZXNzaWNhIFpoYW5nIDxxdWljX2pl
c3N6aGFuQHF1aWNpbmMuY29tPiB3cm90ZToKPiAKPiAKPiBPbiAxMC8yNy8yMDIzIDc6MTkgUE0s
IENsYXl0b24gQ3JhZnQgd3JvdGU6Cj4gPiBUaGlzIHBhbmVsIGlzIGZvdW5kIG9uIGxhcHRvcHMg
ZS5nLiwgdmFyaWFudHMgb2YgdGhlIFRoaW5rcGFkIFgxM3MuCj4gPiBDb25maWd1cmF0aW9uIHdh
cyBjb2xsZWN0ZWQgZnJvbSB0aGUgcGFuZWwncyBFRElELgo+IAo+IEhpIENsYXl0b24sCj4gCj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2ggLS0gaXQgbG9va3MgZ29vZCB0byBtZSBhc2lkZSBmcm9tIG9u
ZSBtaW5vciBjb21tZW50IAo+IGJlbG93Lgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF5
dG9uIENyYWZ0IDxjbGF5dG9uQGNyYWZ0eWd1eS5uZXQ+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtZWRwLmMKPiA+IGluZGV4IDk1Yzg0NzJkODc4YS4uNWRiMjgzZjAxNGYzIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWRwLmMKPiA+IEBAIC0xMjA0LDYgKzEyMDQs
MjkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGJvZV9udjEzM2ZobV9uNjEgPSB7
Cj4gPiAgIAl9LAo+ID4gICB9Owo+ID4gICAKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgYm9lX252MTMzd3VtX242M19tb2RlcyA9IHsKPiAKPiBXaWxsIG90aGVyIG1v
ZGVzIGJlIGFkZGVkIHRvIHRoaXMgc3RydWN0IGluIHRoZSBmdXR1cmU/IElmIHNvLCBJIHRoaW5r
IAo+IHdlIGNhbiBwcm9iYWJseSB0dXJuIHRoaXMgaW50byBhbiBhcnJheSB0byBtYWtlIGl0IGVh
c2llciB0byBleHRlbmQuCgpUbyBiZSBob25lc3QsIEkgaGF2ZSBubyBpZGVhLiBJIHNhdyBhIGtl
cm5lbCBiYWNrdHJhY2UgaW4gZG1lc2cgdGhhdCB3YXMgcmVsYXRlZAp0byB0aGlzIGRyaXZlciBu
b3QgaGF2aW5nIGNvbmZpZyBmb3IgbXkgcGFuZWwsIHNvIEkgYWRkZWQgaXQgYWZ0ZXIgbG9va2lu
ZyBhdApzaW1pbGFyIGV4YW1wbGVzIGhlcmUuCgpQZXJzb25hbGx5IEknZCBwcmVmZXIgbm90IHRv
IGdldCB0b28gZmFuY3kgd2l0aCBhcnJheXMgYW5kIHN1Y2ggdW50aWwgdGhlcmUncwphY3R1YWxs
eSBhIG5lZWQgZm9yIGl0LCBlLmcuLCBzb21lb25lIGNvbWVzIGFsb25nIHdpdGggbW9yZSBtb2Rl
cyB0byBhZGQuIEJ1dCBJCmNhbiB0cnkgdG8gZG8gdGhhdCBpZiBteSAia2VlcCBpdCBzaW1wbGUg
dW50aWwgaXQgbmVlZHMgdG8gYmUgZXh0ZW5kZWQiIGFwcHJvYWNoCmlzIHVuYWNjZXB0YWJsZSA6
KQoKPiBPdGhlcndpc2UsIGNhbiB5b3UgY2hhbmdlIHRoZSBuYW1lIHRvICIqX21vZGUiPyBTZWVt
cyB0byBtZSB0aGF0IGFsbW9zdCAKPiBhbGwgb3RoZXIgcGFuZWxzIHdpdGggYSBzaW5nbGUgbW9k
ZSBoYXZlIHRoZSBuYW1lIGFzICIqX21vZGUiIHdpdGggdGhlIAo+IG9ubHkgZXhjZXB0aW9uIGJl
aW5nIGEgY2Fycnktb3ZlciBmcm9tIG9sZGVyIHBhbmVsLXNpbXBsZS5jIGNvZGUuCgpPayBJJ2xs
IHJlbmFtZSB0byAqX21vZGUgaW4gVjIuIFRoYW5rcyBmb3IgcmV2aWV3aW5nIQoKLUNsYXl0b24K


--4gQ4uxxJyh1jXvVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkdOrrjmBP3eB7DeWSkztbX7flQoFAmVD47cACgkQSkztbX7f
lQqWzg//YAxYtXysU+cSpD0uxR48UfJgW7Uofz4qyzZImkxFFIg0gHNPxj14rYK2
r9sWseAaQbnjj6Q6Diaywhe000bdYgEiL7RGgmvVqEMB8PTWzfAadqYFUIO8hgdJ
Bc8wO50deMdkZZ4l+EovJg45l3di0rMK5ZTcqvqoMVmX17mIMqRD5gitJ5oI+tqj
fPzafCMmbqJ/j5aicv5Y0RwWZTZnB8pN7eHZQiIwsJC903yycoMvebdJhaOqhCCG
2b1gV8SbP/FRnI+z+xwJ6kl7WB9AtBO+HNgN7FbxS3lBnPXCllm2qCdcrne6IjGw
16x324zD4dlUFcit27JAjCrHyduiOppAZVfFbZOucAR4z71tmr5mw+yMOWD9Xdja
EVwhuoS6CeOy2acwiAA9eqFyia4mFogFJOGO5QlgXzk/Ubyb7SG2tpXy3BwZunRf
NsedvpLJITRJpSP1qOLPDaJMJPKow3a6f/uJ8WttatozR1+LhN7J43BFvU7spnKx
RK0U7yYGCloKw4Vg/Vfcb86cHB32hOemsafpynHLOt6Oy4s7jMLZu+5gmGs/tip9
+CmG3VZHVlpYG3+Nxg+IxfUdIV/UTVpPMzL1wPFgpfpfcw+QqW6LG4I9CXHKJ8/a
H25gtqp2/GZv0mINBVt+fhPpi1zP/bSXf2+Xn9UzewGvNfgviWQ=
=z0Pb
-----END PGP SIGNATURE-----

--4gQ4uxxJyh1jXvVV--
