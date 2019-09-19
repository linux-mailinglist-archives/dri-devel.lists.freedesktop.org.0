Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE4B8014
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8226F480;
	Thu, 19 Sep 2019 17:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3106F480
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:36:22 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v8so3971810eds.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEG16py7F7VVQsbEWJankD9qZqhwmFVN/hvOJMskKRg=;
 b=QsQCChu+fhStGj9MptgSZwWvSCBqNcqVuImwz807w9a+tdxWee7XIeF7lca9RemfRQ
 9KzNtptUR18FDF5nCpjI/bXNclbgW+DX6kJ3HTgAT5413C7a9BjZia0fSU+avgfGow6n
 wUv0wve+h6u2CHHnHe39lsuzqLeiwk1L+rWI+7yHhdJfNxLqN6CRonxsUWAtsvvkN0FL
 JryYyJmymcR8D+TeEQMGfdICDqG7suuXaqs5uo4LYOqdKYZW/6QBV3PahoJ4Q2rDwASi
 2gnn0NYbx88oncDRhm+yRkyRxAH8bpYf5qCgXeYE2iAtquTJL6lfstZZhnRUzb+SouGj
 KZHg==
X-Gm-Message-State: APjAAAUsIhM0upE9DASlWtFljCVxrMXnZkqvNzCRz6AwEWh/yOroNMrb
 7XPsbgiq8WvlwEBXWt5iBau12h9ZEeQ=
X-Google-Smtp-Source: APXvYqzjgaAVLzEa6gMSs1cEbvJsMMXOSsaY45aFim/lbtFkuTAMxSQGM++4KckmQtocP6Rh2tRBUw==
X-Received: by 2002:a17:906:f259:: with SMTP id
 gy25mr15702183ejb.2.1568914580255; 
 Thu, 19 Sep 2019 10:36:20 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id w25sm1108299ejq.54.2019.09.19.10.36.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 10:36:20 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id l3so3991798wru.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:36:19 -0700 (PDT)
X-Received: by 2002:a5d:6785:: with SMTP id v5mr8349742wru.9.1568914579468;
 Thu, 19 Sep 2019 10:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190919173020.11655-1-mripard@kernel.org>
In-Reply-To: <20190919173020.11655-1-mripard@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 20 Sep 2019 01:36:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65xgCC99x2SZG84n0mp7B7W5EDVDTgRrvQgdvVXAUxN5A@mail.gmail.com>
Message-ID: <CAGb2v65xgCC99x2SZG84n0mp7B7W5EDVDTgRrvQgdvVXAUxN5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Allwinner DRM drivers entry
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMTozMCBBTSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIERSTSBkcml2ZXJzIGFyZSBtb3JlIHRoYW4gYWJvdXQg
dGhlIEExMCBub3csIHNvIGxldCdzIG1ha2UgdGhlIGVudHJ5Cj4gbmFtZSBhIGJpdCBtb3JlIGdl
bmVyaWMuCj4KPiBBbHNvLCBDaGVuLVl1IGhhcyBiZWVuIGEgZGUtZmFjdG8gbWFpbnRhaW5lciBm
b3IgdGhlIERSTSBkcml2ZXIgZm9yIGEKPiB3aGlsZSwgaXMgYSBtYWludGFpbmVyIG9mIHRoZSBB
bGx3aW5uZXIgcGxhdGZvcm0gZm9yIGFuIGV2ZW4gbG9uZ2VyIHRpbWUsCj4gYW5kIGhhcyBkcm0t
bWlzYyBjb21taXQgYWNjZXNzLiBMZXQncyBtYWtlIGl0IGZvcm1hbCBhbmQgYWRkIGhpbSBhcyBh
CgpBbHRob3VnaCBJIGhhdmUgYW4gYWNjb3VudCwgSSBoYXZlbid0IGFjdHVhbGx5IHRyaWVkIGlm
IEkgaGF2ZSBjb21taXQgYWNjZXNzLgpJIGFsc28gZG9uJ3QgdGhpbmsgbXkgYWNjb3VudCB3YXMg
cHJvcGVybHkgbWlncmF0ZWQgb3ZlciB0byBHaXRMYWIsIGFzIEkKaGFkIHRvIHJlLWNyZWF0ZSBv
bmUuCgo+IG1haW50YWluZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgoK
PiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IGIyMzI2ZGVjZTI4ZS4uNTRlMjIyZTFkMGQ2IDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNTM1Miw4ICs1MzUyLDkgQEAg
RjogICAgICAgIGluY2x1ZGUvZHJtL2RybSoKPiAgRjogICAgIGluY2x1ZGUvdWFwaS9kcm0vZHJt
Kgo+ICBGOiAgICAgaW5jbHVkZS9saW51eC92Z2EqCj4KPiAtRFJNIERSSVZFUlMgRk9SIEFMTFdJ
Tk5FUiBBMTAKPiArRFJNIERSSVZFUlMgRk9SIEFMTFdJTk5FUiBTT0NTCj4gIE06ICAgICBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gK006ICAgICBDaGVuLVl1IFRzYWkgPHdl
bnNAY3NpZS5vcmc+Cj4gIEw6ICAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
IFM6ICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS8KPiAtLQo+
IDIuMjEuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
