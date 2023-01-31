Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763E6861EC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 09:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42EA10E173;
	Wed,  1 Feb 2023 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ED610E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 16:29:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 470D4B81DB0;
 Tue, 31 Jan 2023 16:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727A2C433EF;
 Tue, 31 Jan 2023 16:28:50 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: (subset) [PATCH 00/35] Documentation: correct lots of spelling
 errors (series 1)
Date: Tue, 31 Jan 2023 16:28:48 +0000
Message-Id: <167518251202.582976.5415495075435902323.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Feb 2023 08:47:58 +0000
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
 Henrik Rydberg <rydberg@bitmath.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-spi@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 keyrings@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, linux-trace-kernel@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, isdn4linux@listserv.isdn4linux.de,
 linux-input@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Jiri Kosina <jikos@kernel.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-crypto@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, target-devel@vger.kernel.org,
 bpf@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-trace-devel@vger.kernel.org,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 linux-leds@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Jonas Bonn <jonas@southpole.se>, Heiko Carstens <hca@linux.ibm.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 openrisc@lists.librecores.org, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-security-module@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Jan 2023 22:39:30 -0800, Randy Dunlap wrote:
> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series. [if all goes well]
> 
> These patches are based on linux-next-20230125.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[01/35] Documentation: arm64: correct spelling
        https://git.kernel.org/arm64/c/a70f00e7f1a3

-- 
Catalin

