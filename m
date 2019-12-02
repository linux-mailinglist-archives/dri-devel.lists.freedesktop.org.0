Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2C10E745
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01189F2E;
	Mon,  2 Dec 2019 08:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D389D67
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 08:58:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so11081922wro.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 00:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LxEYdSqnEHUF9G5CGDPZLm+eJwbpYp6WVRngdVorD58=;
 b=eDTYoA8J4xIRd6tlmqgwHiBELZL3tMW9U0rfugiCioykLXw3JnWO9WvshDlQZhW9Qs
 1lz7smqgQZ1+yk3dPUNatKCxGSSDXaON38qWDymXQ75/i2ezPqualLdcpkynPmkauGrA
 kXV/Ug750dawYh9tpTeZeN2RcTw/XqbtmWlJwdN99+PV8oPhLeaDHgwLVlGKfUP1tg4c
 b1fXHZufiSSTXXn4+Q6u1GhXgUJMaY2FR4CbJ4jmP5aYgKndW0kchkI79C4+SMTWMz7x
 OemJgaZzAVeX7orOA/k5V17F2pxAfm+Wfrzy4fFMyBw3bRoyvN+35ynLOEGkzSeeREFd
 Kvng==
X-Gm-Message-State: APjAAAXY+IcJxLq7YwMzHpdDvA48SXjx5uyynfCS5bahFPfy92DPMxFA
 FM8C92R4mnX90aJx5U4CMy04F/CYG3Y=
X-Google-Smtp-Source: APXvYqyTAPXVYVc9ySgZIG/o0pY0kfLCSvbFivnzd4VR93qkVUcTfPCuKp+iQ7oj4ThbvljjgVM23w==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr24487193wrq.57.1575277081687; 
 Mon, 02 Dec 2019 00:58:01 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id n12sm7682105wmd.1.2019.12.02.00.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 00:58:01 -0800 (PST)
Date: Mon, 2 Dec 2019 09:57:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20191202085759.GZ624164@phenom.ffwll.local>
References: <cover.1575203210.git.jsarha@ti.com>
 <43262a281a7461be3dd5859bacc8db9bca41e729.1575203210.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43262a281a7461be3dd5859bacc8db9bca41e729.1575203210.git.jsarha@ti.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LxEYdSqnEHUF9G5CGDPZLm+eJwbpYp6WVRngdVorD58=;
 b=lUwlHuUpsl7dQxUOe7mMMhgtpk93fjwIaCCjNvLThsaEc9FtG2DPUTvftBtNbzZxQQ
 3Q7e1qzrUQRFGV48xXRpwzoKElFndGOl6K41wsaFIjDVLEGR5R6eOwBfXjh/MNBOhjlF
 sq/cmaEhBvTWLhYo61YD7xaa0kWbmwhwlSJv8=
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
Cc: yamonkar@cadence.com, praneeth@ti.com, subhajit_paul@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBEZWMgMDEsIDIwMTkgYXQgMDM6NTA6MjFQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90
ZToKPiBBZGQgZW50cnkgZm9yIHRpZHNzIERSTSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAxMCArKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA3NDFlM2Y0MzNmNmUuLmRkNzg1
NWU1OWJkMSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4g
QEAgLTU1NjcsNiArNTU2NywxNiBAQCBGOglpbmNsdWRlL3VhcGkvZHJtL3YzZF9kcm0uaAo+ICBG
OglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2JyY20sYmNtLXYzZC50eHQK
PiAgVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYwo+ICAK
PiArRFJNIERSSVZFUlMgRk9SIFRJIEtFWVNUT05FCj4gK006CUp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+Cj4gK006CVRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gK0w6
CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiArUzoJTWFpbnRhaW5lZAo+ICtGOglk
cml2ZXJzL2dwdS9kcm0vdGlkc3MvCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3RpL3RpLGsyZy1kc3MudHh0Cj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpL3RpLGFtNjV4LWRzcy50eHQKPiArRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGksajcyMWUtZHNzLnR4dAoKSXMg
dGhpcyBnb2luZyB0byBiZSBtYWludGFpbmVkIGluIHRoZSBUSSB0cmVlLCBvciBpbiBkcm0tbWlz
Yywgb3IKc29tZXdoZXJlIGVsc2U/ICJTb21ld2hlcmUgZWxzZSIgZm9yIHRpbnkgZHJpdmVycyBz
ZWVtcyB0byBub3Qgd29yaywgaWYKdGhleSBjYW4ndCBiZSBhZGRlZCB0byBzb21lIGV4aXN0aW5n
IGdyb3VwIG1haW50YWluZWQgdGhpbmcgLi4uCi1EYW5pZWwKCj4gKwo+ICBEUk0gRFJJVkVSUyBG
T1IgVkM0Cj4gIE06CUVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gIFQ6CWdpdCBnaXQ6
Ly9naXRodWIuY29tL2FuaG9sdC9saW51eAo+IC0tIAo+IFRleGFzIEluc3RydW1lbnRzIEZpbmxh
bmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVz
cyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
