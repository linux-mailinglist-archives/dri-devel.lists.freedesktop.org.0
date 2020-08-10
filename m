Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08095240555
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 13:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1499E89F73;
	Mon, 10 Aug 2020 11:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941FF89F73;
 Mon, 10 Aug 2020 11:25:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 88so7806064wrh.3;
 Mon, 10 Aug 2020 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oTg2lxBtHTJ9GHQqs1UPfQnOTLFgVN0t8PhdBgnUOZo=;
 b=o9v8vl6sxuZv3OE+NRsrsOpuKAl5e53GHbfTnyCtOZV1p2zAW+cLNzN6HOvnefctsr
 YUQIkHHJaFE5NU1fJ7SddpIUAXlGM5yfm7ystzVLYNJZVa4GuyUSeTxTuRv3m1vlVNz6
 OIKMicdaF4eGlNE8pB8WPUk1fddWOqpq9CLr6FKC44fBF9a8L9WOYqu+YAsiQj+yWKNo
 pZFSVzQEQb4u2obVQcJ+6ZsfNPKru3/Vt9nDGZaeYLShIN07zhyl6g3UZpr+6CZgyNpm
 SGfl0IaUx/eMPL9MOVpnZeQ0ayjoAVhA+T8ClKjAraCJRitMvkZL0sN1piaWHV2TLeGw
 XQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oTg2lxBtHTJ9GHQqs1UPfQnOTLFgVN0t8PhdBgnUOZo=;
 b=Pd4UUhs3EM6RuGvfpHdeM5IrOEFAaGNDoBv9WxFuqYcKMehJXl8lYCP1s/fzvpfwQU
 N7uyd8ln63Pj1+dUVWZRmpgACFeJh/btUwnMaevjT+sKlYdaifdEU3Es19yqZMbLUiq5
 SJmLX09LE++jyUH8rQwJw/+CF0OnxJpDgGdEyzcElec85Tl9p2T2vuQD4va9UJMOa6XU
 88iAoY61t0llQ8vDn5Q6hXFiYlLZAjThC2ZSybIDu1ClvLM1iPSC4CMybz9gMEbk+AdI
 us7WNlo1CfTVeueunhrLhM7Odkdano1jBgFkUZ9z+inUyzyiqutgil6bXLIYUPoddM9M
 WFTg==
X-Gm-Message-State: AOAM5335WnYgc5BO9+wKkl/CqZp4wp8qifsDVvVpVV10GO24AWAtbrn2
 qi2VAX9Yh50FJXpR8YHwUR0=
X-Google-Smtp-Source: ABdhPJwu7ulsQB2sIxkwOEtiTddoyOl0dMfmiZCjLvbUiY7InajwnIBXsggut18F6II9XAC3RPytGQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr23634015wru.112.1597058744166; 
 Mon, 10 Aug 2020 04:25:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h11sm18407755wrb.68.2020.08.10.04.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 04:25:43 -0700 (PDT)
Subject: Re: [PATCH] dma-buf.rst: repair length of title underline
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200809061739.16803-1-lukas.bulwahn@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7d434810-79bd-89a3-18f8-c5c2a2524822@gmail.com>
Date: Mon, 10 Aug 2020 13:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200809061739.16803-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDguMjAgdW0gMDg6MTcgc2NocmllYiBMdWthcyBCdWx3YWhuOgo+IFdpdGggY29tbWl0
IDcyYjZlZGU3MzYyMyAoImRtYS1idWYucnN0OiBEb2N1bWVudCB3aHkgaW5kZWZpbml0ZSBmZW5j
ZXMgYXJlCj4gYSBiYWQgaWRlYSIpLCBkb2N1bWVudCBnZW5lcmF0aW9uIHdhcm5zOgo+Cj4gICAg
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0OjE4MjogXAo+ICAgIFdBUk5JTkc6
IFRpdGxlIHVuZGVybGluZSB0b28gc2hvcnQuCj4KPiBSZXBhaXIgbGVuZ3RoIG9mIHRpdGxlIHVu
ZGVybGluZSB0byByZW1vdmUgd2FybmluZy4KPgo+IEZpeGVzOiA3MmI2ZWRlNzM2MjMgKCJkbWEt
YnVmLnJzdDogRG9jdW1lbnQgd2h5IGluZGVmaW5pdGUgZmVuY2VzIGFyZSBhIGJhZCBpZGVhIikK
PiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdtYWlsLmNvbT4K
CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpT
aG91bGQgSSBwaWNrIGl0IHVwIGludG8gZHJtLW1pc2MtbmV4dD8KCj4gLS0tCj4gRGFuaWVsLCBw
bGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdlbnQgZml4IHRvIHlvdXIgbmV3IGRvY3VtZW50
YXRpb24uCj4KPiAgIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCBiL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+IGluZGV4IDEwMGJmZDIyNzI2NS4uMTNlYTBj
YzBhM2ZhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJz
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+IEBAIC0xNzks
NyArMTc5LDcgQEAgRE1BIEZlbmNlIHVBQkkvU3luYyBGaWxlCj4gICAgICA6aW50ZXJuYWw6Cj4g
ICAKPiAgIEluZGVmaW5pdGUgRE1BIEZlbmNlcwo+IC1+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICt+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgIAo+ICAgQXQgdmFyaW91cyB0aW1lcyAmZG1hX2ZlbmNl
IHdpdGggYW4gaW5kZWZpbml0ZSB0aW1lIHVudGlsIGRtYV9mZW5jZV93YWl0KCkKPiAgIGZpbmlz
aGVzIGhhdmUgYmVlbiBwcm9wb3NlZC4gRXhhbXBsZXMgaW5jbHVkZToKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
