Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FDCEC35
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0344C6E156;
	Mon,  7 Oct 2019 18:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A156E156;
 Mon,  7 Oct 2019 18:54:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j18so15756318wrq.10;
 Mon, 07 Oct 2019 11:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQcOGUTHfO/bHwXtRoACnVGMfWQ7WlONlR3KblVpn3I=;
 b=KMBkGkoftkaDLHL20Vdks+yXAadZKufrd6eUI61A1+akxxGApe11113T0tTPrMSHd1
 0kcuVE3WQ3f0bSk2EB9TTFJl5xeHXNe/j/tT0LcB1OjttX0Iq7ToveVcGrXCIbeytZQJ
 GCHlawWJsjgfi1yyGe5wVQez04GuQN+mtZPjdLPV0cTHb8d7dWOhracyUPfneifG7Kn0
 jZe/mP8/81kWNTIh3/2UF1WkgeCwITh4yTC7s4LOwMtEGfUUXSsgZ7uGrnrW36BXRZNk
 fTt2nzv8QNXOqiI0mnI3WZwzO/Vk04SMasyXhJo9YvVf7SLeM0LkPpNYHVWE04exDclw
 gM2A==
X-Gm-Message-State: APjAAAVQIWTE7R2cEPTp6FNNZrk2yN9L7DmXYNlghoPLxjM6Sbef1lp0
 5y/Y0vDbOqK9x7ZmPS6iFC1hT1xpob9YTK/QXfU=
X-Google-Smtp-Source: APXvYqzON7sOsPzp1Tk+w4HqTa/WQrWkfVsembsWxklnM+yW7t2zngU61jGW9q83KCDxVjYgsyHvvoztig7e4/bxL4s=
X-Received: by 2002:adf:f287:: with SMTP id k7mr24800437wro.206.1570474465219; 
 Mon, 07 Oct 2019 11:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191007173322.9306-1-krzk@kernel.org>
In-Reply-To: <20191007173322.9306-1-krzk@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 14:54:13 -0400
Message-ID: <CADnq5_MpRZKTKLbJhzKOS=boP8RwvXPzkk0vBnJeRPgTHxStJQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd: Fix Kconfig indentation
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MQcOGUTHfO/bHwXtRoACnVGMfWQ7WlONlR3KblVpn3I=;
 b=XszFQacSBW4ktTMc6TvptZPfwjJCzK9C16AwItg41HgWbI8R4mCw0qrQVum2W02ywO
 4vrQbaR/aX5Anv77ybANXeuPdJwFt5XWJOq17xCRHVbBDtcPT0eamMG1DBiwa7/EMZxk
 nGW21Ys/3OIAMKezIA4HuASy+f9PKIS4GLS6z32nVoC6RARkjix5TvT5ZZXesY0zusZS
 mz+0ZbPZNabeiLdOcNQ7qvsKRplT06+VPlGSAjz0q/GGTaeJe6+MwxyX/mzTJVXjNz87
 CRKH1nKJ3Jg1NIfGPK7izd0mW3wPqve6DTo6mnNNu/F5ZR+DOC6hbUl33D/81OVBdMJC
 EAEQ==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAxOjMzIFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8g
dGFiICgrb3B0aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21t
YW5kIGxpa2U6Cj4gICAgICQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+
Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoK
QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4KPiAtLS0KPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4g
MS4gU3BsaXQgQU1EIGFuZCBpOTE1IHRvIHNlcGFyYXRlIHBhdGNoZXMuCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyB8IDMyICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZwo+IGluZGV4IDEwOGUxYjdmNDU2NC4uN2NiNmU0ZWI5OWU4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcK
PiBAQCAtMjI2LDkgKzIyNiw5IEBAIGNvbmZpZyBEUk1fQU1ER1BVCj4gICAgICAgICB0cmlzdGF0
ZSAiQU1EIEdQVSIKPiAgICAgICAgIGRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBNTVUKPiAgICAg
ICAgIHNlbGVjdCBGV19MT0FERVIKPiAtICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAr
ICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICAgICAgICAgc2VsZWN0IERSTV9TQ0hFRAo+
IC0gICAgICAgIHNlbGVjdCBEUk1fVFRNCj4gKyAgICAgICBzZWxlY3QgRFJNX1RUTQo+ICAgICAg
ICAgc2VsZWN0IFBPV0VSX1NVUFBMWQo+ICAgICAgICAgc2VsZWN0IEhXTU9OCj4gICAgICAgICBz
ZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29u
ZmlnCj4gaW5kZXggMWJiZTc2MmVlNmJhLi4zMTMxODNiODAwMzIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvS2NvbmZpZwo+IEBAIC0yMywxNiArMjMsMTYgQEAgY29uZmlnIERSTV9BTURf
RENfRENOMl8wCj4gICAgICAgICBkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2Cj4gICAgICAg
ICBkZXBlbmRzIG9uIERSTV9BTURfRENfRENOMV8wCj4gICAgICAgICBoZWxwCj4gLSAgICAgICAg
ICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKPiAtICAgICAgICAgICBO
YXZpIHN1cHBvcnQgZm9yIGRpc3BsYXkgZW5naW5lCj4gKyAgICAgICAgIENob29zZSB0aGlzIG9w
dGlvbiBpZiB5b3Ugd2FudCB0byBoYXZlCj4gKyAgICAgICAgIE5hdmkgc3VwcG9ydCBmb3IgZGlz
cGxheSBlbmdpbmUKPgo+ICBjb25maWcgRFJNX0FNRF9EQ19EQ04yXzEKPiAtICAgICAgICBib29s
ICJEQ04gMi4xIGZhbWlseSIKPiAtICAgICAgICBkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2
Cj4gLSAgICAgICAgZGVwZW5kcyBvbiBEUk1fQU1EX0RDX0RDTjJfMAo+IC0gICAgICAgIGhlbHAK
PiAtICAgICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKPiAt
ICAgICAgICAgICAgUmVub2lyIHN1cHBvcnQgZm9yIGRpc3BsYXkgZW5naW5lCj4gKyAgICAgICBi
b29sICJEQ04gMi4xIGZhbWlseSIKPiArICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQyAmJiBY
ODYKPiArICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQ19EQ04yXzAKPiArICAgICAgIGhlbHAK
PiArICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKPiArICAg
ICAgICAgUmVub2lyIHN1cHBvcnQgZm9yIGRpc3BsYXkgZW5naW5lCj4KPiAgY29uZmlnIERSTV9B
TURfRENfRFNDX1NVUFBPUlQKPiAgICAgICAgIGJvb2wgIkRTQyBzdXBwb3J0Igo+IEBAIC00MSwx
NiArNDEsMTYgQEAgY29uZmlnIERSTV9BTURfRENfRFNDX1NVUFBPUlQKPiAgICAgICAgIGRlcGVu
ZHMgb24gRFJNX0FNRF9EQ19EQ04xXzAKPiAgICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQ19E
Q04yXzAKPiAgICAgICAgIGhlbHAKPiAtICAgICAgICAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYg
eW91IHdhbnQgdG8gaGF2ZQo+IC0gICAgICAgICAgIER5bmFtaWMgU3RyZWFtIENvbXByZXNzaW9u
IHN1cHBvcnQKPiArICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhh
dmUKPiArICAgICAgICAgRHluYW1pYyBTdHJlYW0gQ29tcHJlc3Npb24gc3VwcG9ydAo+Cj4gIGNv
bmZpZyBEUk1fQU1EX0RDX0hEQ1AKPiAtICAgICAgICBib29sICJFbmFibGUgSERDUCBzdXBwb3J0
IGluIERDIgo+IC0gICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQwo+IC0gICAgICAgIGhlbHAK
PiAtICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uCj4gLSAgICAgICAgIGlmIHlvdSB3YW50IHRv
IHN1cHBvcnQKPiAtICAgICAgICAgSERDUCBhdXRoZW50aWNhdGlvbgo+ICsgICAgICAgYm9vbCAi
RW5hYmxlIEhEQ1Agc3VwcG9ydCBpbiBEQyIKPiArICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9E
Qwo+ICsgICAgICAgaGVscAo+ICsgICAgICAgIENob29zZSB0aGlzIG9wdGlvbgo+ICsgICAgICAg
IGlmIHlvdSB3YW50IHRvIHN1cHBvcnQKPiArICAgICAgICBIRENQIGF1dGhlbnRpY2F0aW9uCj4K
PiAgY29uZmlnIERFQlVHX0tFUk5FTF9EQwo+ICAgICAgICAgYm9vbCAiRW5hYmxlIGtnZGIgYnJl
YWsgaW4gREMiCj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
