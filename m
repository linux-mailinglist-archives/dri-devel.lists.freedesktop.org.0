Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0073736B1B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ABD10E2C2;
	Tue, 20 Jun 2023 11:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAE3510E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:37:33 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:45814.2105340369
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id E8F2E1001DC;
 Tue, 20 Jun 2023 19:37:27 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 5498305f1b5f4862ab1283f4a352009b for helgaas@kernel.org; 
 Tue, 20 Jun 2023 19:37:28 CST
X-Transaction-ID: 5498305f1b5f4862ab1283f4a352009b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <43794f47-bb96-071a-fa18-80283e2721fe@189.cn>
Date: Tue, 20 Jun 2023 19:37:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230620110600.GA40675@bhelgaas>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230620110600.GA40675@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, Li Yi <liyi@loongson.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jesse Barnes <jbarnes@virtuousgeek.org>, loongson-kernel@lists.loongnix.cn,
 Ben Hutchings <bhutchings@solarflare.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Wilcox <willy@infradead.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/20 19:06, Bjorn Helgaas wrote:
> On Tue, Jun 20, 2023 at 12:04:40PM +0800, Sui Jingfeng wrote:
>> Where is the formal(unstream) PCI git branch where we could see the latest
>> patch ?
> Here's the "misc" branch: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=misc
>
> And here's the "next" branch that will be merged for v6.5, which
> includes "misc" and other things: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=next


Thanks for you kindness reply and guidance, now I know that.

