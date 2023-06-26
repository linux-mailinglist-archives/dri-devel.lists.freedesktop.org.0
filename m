Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8632673DB77
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3D10E00C;
	Mon, 26 Jun 2023 09:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6510E088
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 06:56:42 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1b80512a7f2so3273105ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 23:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687762601; x=1690354601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u58j1CoFhNAAP0kPknc/GhPhE9N5OmJCD1ZWCCtRRgc=;
 b=bnIeGOmDOYmuDJvFgA7d77P84wU99nlnohbm5DsmSllkAZNOuwmmobRcjBeqecTOKV
 z/kIL5rnnTjLCeaYZeimobt/xgczpZDza8pP5cPwMs3Qo72MTKlkv+4AflKFALuSV+z6
 d1PC2SXkRvGrSrh8NtobY/zcYFrrhbds79AALB4ZjqeWm5ZwxVDyiJPKP6qFsTcHx1KU
 45QeqJ1YgUA2LB2zp7ufVTIaACkGac7Xaz5TOGFpLnjdRUD+wsdxzAhnEeRZ3893e8f7
 EPaC2gBnJ0+DOaqTekQ+mdzlts4xsuHAqAMGt2+PAxVrhB2pBDp+jfd0h1oW5bENXd9j
 9q7w==
X-Gm-Message-State: AC+VfDw+cllih1YbFIq8K2aWx9peBvhQ+tDZ3G10zhwBR67p0aaYI5rk
 rDe08r6RhfmyapisPLOHbDc=
X-Google-Smtp-Source: ACHHUZ6OtbsuuY2aXoeHYGi4XSA3mdaoGOU6p/4pXML9TF8F1ADk58bPj18ptJOfaGu5YjoBFEMRig==
X-Received: by 2002:a17:903:1250:b0:1b5:3c7f:1b3b with SMTP id
 u16-20020a170903125000b001b53c7f1b3bmr5150508plh.35.1687762601317; 
 Sun, 25 Jun 2023 23:56:41 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 jg3-20020a17090326c300b001a2104d706fsm2559571plb.225.2023.06.25.23.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 23:56:40 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:56:39 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 00/24 v2] Documentation: correct lots of spelling errors
 (series 1)
Message-ID: <20230626065639.GA3403711@rocinante>
References: <20230209071400.31476-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209071400.31476-1-rdunlap@infradead.org>
X-Mailman-Approved-At: Mon, 26 Jun 2023 09:35:17 +0000
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-trace-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 keyrings@vger.kernel.org, live-patching@vger.kernel.org,
 Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, Paul Moore <paul@paul-moore.com>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-xtensa@linux-xtensa.org, Marc Zyngier <maz@kernel.org>,
 Helge Deller <deller@gmx.de>, Henrik Rydberg <rydberg@bitmath.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 linux-security-module@vger.kernel.org, linux-input@vger.kernel.org,
 coresight@lists.linaro.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Petr Mladek <pmladek@suse.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, Karsten Keil <isdn@linux-pingi.de>,
 Jonas Bonn <jonas@southpole.se>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-trace-devel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series.
> 
> These patches are based on linux-next-20230209.
> 
[...]
>  [PATCH 13/24] Documentation: PCI: correct spelling
[...]

Applied to misc, thank you!

[1/1] Documentation: PCI: correct spelling
      https://git.kernel.org/pci/pci/c/b58d6d89ae02

	Krzysztof
