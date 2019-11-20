Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AF104109
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFE46E91B;
	Wed, 20 Nov 2019 16:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAF66E91B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:41:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g206so21162wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=DoBrdkQjnM2M/sNIIdwf16laThZkuQKlh8PPcfsQfYM=;
 b=M4E0S2woJshyN6cmJ+a/QRWbPaxFYNK8/mWopiXD8YsPKZUmHsRrUMSwvJ4Jxd0FQ1
 s8/9s/4SgGIb9fo7jr73jyRGDw8lZvlRNjPtmnv1tcCDKi7K2/R1Hdjw/JJgZugCvMUF
 pbILZRoiC4VLPmcIeDIrFp5slz6fB02myme15QTq6DeZmH++D3TcjcIIhGt5DvK4aFi0
 uVg6mxdkPiI4nCficvvD0M7L12lWsB/nP486PdMd1LDZutsWEaabaCZJJsukxdn759FJ
 SB7Wp0j+qdvHtp5qqyKHM8az+D6TX50uJ3REmeetMnfmToSu+cKFAAp41LhHX6wCr9gs
 HXaA==
X-Gm-Message-State: APjAAAUMqwBmLEQe1AU9U8sgdusr/T/eMF6ap/YN5MAukWZBcUP+ziwM
 y2nuOx5GLou25cVW+X32BaWTSAmlS3s=
X-Google-Smtp-Source: APXvYqxcp61Ouq7qqx6fMqpJbU5o8VCWsZA5gd0+Tv52/4/6QtREkNjADbOEaEE5seygIX0OYcGmYw==
X-Received: by 2002:a1c:cc01:: with SMTP id h1mr4269171wmb.172.1574268118420; 
 Wed, 20 Nov 2019 08:41:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm32071445wrt.61.2019.11.20.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:41:57 -0800 (PST)
Date: Wed, 20 Nov 2019 17:41:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] staging: fbtft: Fix Kconfig indentation
Message-ID: <20191120164155.GR30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191120133911.13539-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133911.13539-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DoBrdkQjnM2M/sNIIdwf16laThZkuQKlh8PPcfsQfYM=;
 b=GN0/nFYDPFzOUrHsl9BbUvlxMEQgUTa5wU0hEQG8hzQRTEesfxWZBj4Q/qj3QnsV4K
 AjN2mkwABi+vsodfnJLOTctxxyuhkQ55UuAtU8xswqrCnp7gxOrM8XDS6g1oeux1y2AZ
 q8O3Fd5bQRf9OxPkeDbthgLX0cnVMUMd6NecI=
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6Mzk6MTFQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKSSBleHBlY3QgR3JlZyB3aWxs
IHBpY2sgdGhpcyB1cC4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tj
b25maWcgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L0tjb25maWcgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvS2NvbmZpZwo+IGluZGV4IGQ5OTRhZWE4
NGIyMS4uMTlkOWQ4OGU5MTUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcKPiBAQCAtOTUsOCAr
OTUsOCBAQCBjb25maWcgRkJfVEZUX1BDRDg1NDQKPiAgCSAgR2VuZXJpYyBGcmFtZWJ1ZmZlciBz
dXBwb3J0IGZvciBQQ0Q4NTQ0Cj4gIAo+ICBjb25maWcgRkJfVEZUX1JBODg3NQo+IC0gICAgICAg
IHRyaXN0YXRlICJGQiBkcml2ZXIgZm9yIHRoZSBSQTg4NzUgTENEIENvbnRyb2xsZXIiCj4gLSAg
ICAgICAgZGVwZW5kcyBvbiBGQl9URlQKPiArCXRyaXN0YXRlICJGQiBkcml2ZXIgZm9yIHRoZSBS
QTg4NzUgTENEIENvbnRyb2xsZXIiCj4gKwlkZXBlbmRzIG9uIEZCX1RGVAo+ICAJaGVscAo+ICAJ
ICBHZW5lcmljIEZyYW1lYnVmZmVyIHN1cHBvcnQgZm9yIFJBODg3NQo+ICAKPiBAQCAtMTMyLDEw
ICsxMzIsMTAgQEAgY29uZmlnIEZCX1RGVF9TU0QxMjg5Cj4gIAkgIEZyYW1lYnVmZmVyIHN1cHBv
cnQgZm9yIFNTRDEyODkKPiAgCj4gIGNvbmZpZyBGQl9URlRfU1NEMTMwNQo+IC0gICAgICAgIHRy
aXN0YXRlICJGQiBkcml2ZXIgZm9yIHRoZSBTU0QxMzA1IE9MRUQgQ29udHJvbGxlciIKPiAtICAg
ICAgICBkZXBlbmRzIG9uIEZCX1RGVAo+IC0gICAgICAgIGhlbHAKPiAtICAgICAgICAgIEZyYW1l
YnVmZmVyIHN1cHBvcnQgZm9yIFNTRDEzMDUKPiArCXRyaXN0YXRlICJGQiBkcml2ZXIgZm9yIHRo
ZSBTU0QxMzA1IE9MRUQgQ29udHJvbGxlciIKPiArCWRlcGVuZHMgb24gRkJfVEZUCj4gKwloZWxw
Cj4gKwkgIEZyYW1lYnVmZmVyIHN1cHBvcnQgZm9yIFNTRDEzMDUKPiAgCj4gIGNvbmZpZyBGQl9U
RlRfU1NEMTMwNgo+ICAJdHJpc3RhdGUgIkZCIGRyaXZlciBmb3IgdGhlIFNTRDEzMDYgT0xFRCBD
b250cm9sbGVyIgo+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
