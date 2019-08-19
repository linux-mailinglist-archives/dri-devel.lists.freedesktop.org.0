Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E599211E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4B888F04;
	Mon, 19 Aug 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C9C6E0E7;
 Mon, 19 Aug 2019 09:38:52 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ze7ghLtkkDqPeze7khngI6; Mon, 19 Aug 2019 11:38:50 +0200
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
Date: Mon, 19 Aug 2019 11:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPDgGfS7c9tn4rafxcc15L+sdU94YNd12NYSgxtW27RjNdWt8soWf0p7zwZtSmj5HF9HsGpidCpnUpt5hDO/L/H68USjBoTVY6y1GnWXCIZIGReaUbCR
 r4vAQe5xN1v/w07oNHcOJEsALfrneb1NuHIyy7V6sy8SIyaqln5q6vgESUB5xmUmpjy4J2O7D6fMHK+OU+bRJ9fYkvsP+Uc1l3/bG66OSNAQMIGJgtsV4V9i
 ILw/etbBTDN7if1Tx31wHjdGiAqAi2pNFQmMYTY5myx6Zdx9FohbrBpgZlTicKwY1GlNJ9Iyh3AoVqqW1A8DqPYjFzp9Ll5zCNL3o5E2o11NlByJtcaZxbdb
 ZzMqPs6UKce370BAWUuRPehhbW6Di1dnt0WRsX2wZQ/VdQu7h4ZauWcS91g3bhRrgqS9bzdyGIpOjL87l2z8V9uBXaKe2ZzI9v+iYftgLh7dRwbvkIsodc3L
 WSoB8f180Sr1hqSugtvbyhNsAz0YjYmzNY3N9pdgBp+SXQvKyt4hoILiopomIs4P/sy1Z5DxYk6FugifGpJIu1+7L6C+KppnIjS8pNy6VK+oGq4FEr3vh8yB
 GxK95UWqdQSIhX5OpbXpMoJ1xZmtr0G+RKLUKZDTYJSdjAUPeR/nzCbyJnokpxsiyNJnK4uM/ViGRSjjxIDEsrh+rESV2nH1GrdKW7cijdSormeE7cD32w/Y
 SX3ShlplIcVz0YZ5B8TsYacwnzQTsn4VUfa/28rKuR6IqQuOAgHZnAlsMMhXgsG1r2OSGeLsTxxaMWxH0amG69rQr+TNjlWMj/cr+E6orZcfJlTMcRWxYl9s
 pStvJvOg2MVG68BZKEV+zg/qwvrlhBBPPX0ZnnNTfJ+iQv5pjalUb9V4NR+zO6Qg54qpGx0riTn+U77CD6GTAk6QtjbbB+nCdXM33ABE2eN2Hgh4tc1ruyeg
 9mcen89SqOMwc8sv/qhbPgWy3HH+8lVyhyOBp+hmdZ8rG/D+z2mq2ChOL+dcZZR8AkwGQjqwvAaRWg5JHa+Y5KTiYFP83SDWVbrNyxGr3zRZffKLNhowaDJn
 zHowYOOzbcQVlLA1ur0m5DgUw5xYQ0UkqTnJ6Tlsb9DeEI2CKn9KGZYNj30AuDa9UxqQpbm3MDZAcA8RHy4gocSZFLl1QNgdacx/7qqpgtPzScG6Ys3q3Xxw
 I0yKiDHFPgtI7wAeA2FVAF1U0T+zL+XSN+JFmJ8tInpbkc2DGoFlTHOifew7zb3whYgFm8yo1XlmgYVMOodmQN27MgKXEZSu8e+48bmOZMThMe4c0hB7HIQ1
 isOyI2fWFj4vcXK+iyPqg6WPTlG2knIJKBvRjbCUXfG+BlthwJNCaWT9hIW2+EkaB7acj4Mz4wiysngKHyZeWWVtQP7lT/zOY8Un7oWmFWfQttd+y+/nHxEg
 nsVrYV+6yi3BHXec
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Thomas Lim <Thomas.Lim@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgaW5kZXBl
bmRlbnRseSBmcm9tIGVhY2ggb3RoZXIuCgpJZiB5b3UgbWFpbnRhaW4gb25lIG9mIHRoZXNlIGRy
aXZlcnMgYW5kIHlvdSB3YW50IHRvIG1lcmdlIGl0IGZvciB2NS40CnlvdXJzZWxmLCB0aGVuIHBs
ZWFzZSBkbyBzbyBhbmQgbGV0IG1lIGtub3cuIElmIHlvdSBwcmVmZXIgSSBjb21taXQgaXQKdG8g
ZHJtLW1pc2MsIHRoZW4gcGxlYXNlIHJldmlldyBhbmQgKGhvcGVmdWxseSkgQWNrIHRoZSBwYXRj
aC4KCkkgd291bGQgcmVhbGx5IGxpa2UgdG8gZ2V0IHRoaXMgaW4gZm9yIHY1LjQgc28gSSBjYW4g
Z2V0IHRoZSB1c2Vyc3BhY2UKYml0cyBpbiBmb3IgdjUuNCBhcyB3ZWxsIHRocm91Z2ggdGhlIG1l
ZGlhIHN1YnN5c3RlbS4KCkRhcml1c3osIGNhbiB5b3UgcG9zdCBhIHY3LjEgZm9yIHBhdGNoIDUv
OSBmaXhpbmcgdGhlIHR5cG8/CgpUaGFua3MhCgoJSGFucwoKT24gOC8xNC8xOSAxMjo0NCBQTSwg
RGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFRoaXMgc2VyaWVzIHVwZGF0ZXMgRFJNIGRy
aXZlcnMgdG8gdXNlIG5ldyBDRUMgbm90aWZpZXIgQVBJLgo+IAo+IENoYW5nZXMgc2luY2UgdjY6
Cj4gCU1hZGUgQ0VDIG5vdGlmaWVycycgcmVnaXN0cmF0aW9uIGFuZCBkZS1yZWdpc3RyYXRpb24g
c3ltbWV0cmljCj4gCWluIHRkYTk5OHggYW5kIGR3LWhkbWkgZHJpdmVycy4gQWxzbywgYWNjaWRl
bnRhbGx5IGRyb3BwZWQgb25lCj4gCXBhdGNoIGluIHY2IChjaGFuZ2UgdG8gZHJtX2RwX2NlYyks
IGJyb3VnaHQgaXQgYmFjayBub3cuCj4gQ2hhbmdlcyBzaW5jZSB2NToKPiAgICAgICAgIEZpeGVk
IGEgd2FybmluZyBhYm91dCBhIG1pc3NpbmcgY29tbWVudCBmb3IgYSBuZXcgbWVtYmVyIG9mCj4g
CWRybV9kcF9hdXhfY2VjIHN0cnVjdC4gU2VuZGluZyB0byBhIHdpZGVyIGF1ZGllbmNlLAo+IAlp
bmNsdWRpbmcgbWFpbnRhaW5lcnMgb2YgcmVzcGVjdGl2ZSBkcml2ZXJzLgo+IENoYW5nZXMgc2lu
Y2UgdjQ6Cj4gCUFkZHJlc3NpbmcgcmV2aWV3IGNvbW1lbnRzLgo+IENoYW5nZXMgc2luY2UgdjM6
Cj4gICAgICAgICBVcGRhdGVkIGFkYXB0ZXIgZmxhZ3MgaW4gZHctaGRtaS1jZWMuCj4gQ2hhbmdl
cyBzaW5jZSB2MjoKPiAJSW5jbHVkZSBhbGwgRFJNIHBhdGNoZXMgZnJvbSAiY2VjOiBpbXByb3Zl
IG5vdGlmaWVyIHN1cHBvcnQsCj4gCWFkZCBjb25uZWN0b3IgaW5mbyBjb25uZWN0b3IgaW5mbyIg
c2VyaWVzLgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gCVRob3NlIHBhdGNoZXMgZGVsYXkgY3JlYXRp
b24gb2Ygbm90aWZpZXJzIHVudGlsIHJlc3BlY3RpdmUKPiAJY29ubmVjdG9ycyBhcmUgY29uc3Ry
dWN0ZWQuIEl0IHNlZW1zIHRoYXQgdGhvc2UgcGF0Y2hlcywgZm9yIGEKPiAJY291cGxlIG9mIGRy
aXZlcnMsIGJ5IGFkZGluZyB0aGUgZGVsYXksIGludHJvZHVjZSBhIHJhY2UgYmV0d2Vlbgo+IAlu
b3RpZmllcnMnIGNyZWF0aW9uIGFuZCB0aGUgSVJRcyBoYW5kbGluZyB0aHJlYWRzIC0gYXQgbGVh
c3QgSQo+IAlkb24ndCBzZWUgYW55dGhpbmcgb2J2aW91cyBpbiB0aGVyZSB0aGF0IHdvdWxkIGV4
cGxpY2l0bHkgZm9yYmlkCj4gCXN1Y2ggcmFjZXMgdG8gb2NjdXIuIHYyIGFkZHMgYSB3cml0ZSBi
YXJyaWVyIHRvIG1ha2Ugc3VyZSBJUlEKPiAJdGhyZWFkcyBzZWUgdGhlIG5vdGlmaWVyIG9uY2Ug
aXQgaXMgY3JlYXRlZCAocmVwbGFjaW5nIHRoZQo+IAlXUklURV9PTkNFIEkgcHV0IGluIHYxKS4g
VGhlIGJlc3QgdGhpbmcgdG8gZG8gaGVyZSwgSSBiZWxpZXZlLAo+IAl3b3VsZCBiZSBub3QgdG8g
aGF2ZSBhbnkgc3luY2hyb25pemF0aW9uIGFuZCBtYWtlIHN1cmUgdGhhdCBhbiBJUlEKPiAJb25s
eSBnZXRzIGVuYWJsZWQgYWZ0ZXIgdGhlIG5vdGlmaWVyIGlzIGNyZWF0ZWQuCj4gRGFyaXVzeiBN
YXJjaW5raWV3aWN6ICg5KToKPiAgIGRybV9kcF9jZWM6IGFkZCBjb25uZWN0b3IgaW5mbyBzdXBw
b3J0Lgo+ICAgZHJtL2k5MTUvaW50ZWxfaGRtaTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bily
ZWdpc3Rlcgo+ICAgZHctaGRtaS1jZWM6IHVzZSBjZWNfbm90aWZpZXJfY2VjX2FkYXBfKHVuKXJl
Z2lzdGVyCj4gICB0ZGE5OTUwOiB1c2UgY2VjX25vdGlmaWVyX2NlY19hZGFwXyh1bilyZWdpc3Rl
cgo+ICAgZHJtOiB0ZGE5OTh4OiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCj4g
ICBkcm06IHN0aTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rlcgo+ICAgZHJtOiB0
ZWdyYTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rlcgo+ICAgZHJtOiBkdy1oZG1p
OiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCj4gICBkcm06IGV4eW5vczogZXh5
bm9zX2hkbWk6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKPiAKPiAgLi4uL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgIDIgKy0KPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jIHwgMTMgKysrLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICB8IDQ2ICsrKysrKysr
KysrKystLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYyAgICAgICAgICAgICAg
ICAgIHwgMjUgKysrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1p
LmMgICAgICAgICAgfCAzMSArKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk1MC5jICAgICAgICAgICAgICAgICB8IDEyICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pMmMv
dGRhOTk4eF9kcnYuYyAgICAgICAgICAgICB8IDM2ICsrKysrKysrKystLS0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgNCArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICAgfCAxMyArKysrLS0KPiAgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyAgIHwgIDMgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jICAgICAgICAgICAgICAgIHwgMTkgKysrKystLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jICAgICAgICAgICAgICAgIHwgMjggKysr
KysrKystLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAg
IHwgMTcgKysrKy0tLQo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgOTQg
ZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
